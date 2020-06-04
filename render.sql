drop domain if exists lib_mustache.fn cascade;
create domain lib_mustache.fn as text;

create or replace function lib_mustache._identity(string$ text) returns text as
$$
begin
    return string$;
end ;
$$ language plpgsql;

-- HTML escape all of these " & < >
create or replace function lib_mustache._html_escape(string$ text) returns text as
$$
declare
    html_codes$ text[];
    html_code$  text[];
begin
    -- https://github.com/noahmorrison/chevron/blob/master/chevron/renderer.py#L34
    -- https://github.com/janl/mustache.js/blob/a7f1c3dde9999a044284d34001de392351de0a01/mustache.js#L67

    html_codes$ = array[
        ['&', '&amp;'],
        ['<', '&lt;'],
        ['>', '&gt;'],
        ['"', '&quot;'],
        [$_$'$_$, '&#39;'],
        ['/', '&#x2F;'],
        ['`', '&#x60;'],
        ['=', '&#x3D;']
    ];


    --# & must be handled first
    foreach html_code$ slice 1 in array html_codes$
        loop
            string$ = replace(string$, html_code$[1], html_code$[2]);
        end loop;

    return string$;
end ;
$$ language plpgsql;

create or replace function lib_mustache._process_with_regexp(input$ text, view$ jsonb, regexp$ text, map$ lib_mustache.fn) returns text as

$$
declare
    _row$        record;
    __parts$     text[];
    _output$     text[];
    _idx$        integer;
    _json_path$  text[];
    _json_value$ text;
    fn$          text;
begin
    -- e.g. {<h1>,</h1><p>,</p>}
    __parts$ = regexp_split_to_array(input$, regexp$);

    _idx$ = 1;
    _output$ = array_append(_output$, __parts$[_idx$]);

    for _row$ in select regexp_matches(input$, regexp$, 'g') as matches
        loop
            -- construct json path as a text[]
            _json_path$ = regexp_split_to_array(trim(_row$.matches[1]), '\.');

            -- resolve value
            _json_value$ = coalesce(jsonb_extract_path_text(view$, variadic _json_path$), '')::text;

            -- map value
            fn$ = format('select %1$s(%2$L);', map$, _json_value$);
            execute fn$ into _json_value$;
            raise notice '% => %',fn$, _json_value$;

            _output$ = array_append(_output$, _json_value$);

            -- append next part
            _idx$ = _idx$ + 1;
            _output$ = array_append(_output$, __parts$[_idx$]);
        end loop;

    return array_to_string(_output$, '');
end;
$$ language plpgsql;


create or replace function lib_mustache.render(template$ text, view$ jsonb, partials$ jsonb default '{}',
                                               tags$ text[] default array ['{{', '}}']) returns text as
$$
declare
    _output$           text;
begin
    _output$ = template$;

    -- first pass run the unescaped interpolations
    -- Use & to unescape a variable: {{& name}}. This may be useful when changing delimiters (see "Set Delimiter" below).
    -- @todo optimize this

    -- Use & to unescape a variable: {{& name}}. This may be useful when changing delimiters (see "Set Delimiter" below).
    _output$ = lib_mustache._process_with_regexp(_output$,
                                                 view$,
                                                 format('(?:%1$s&)([^(?:%2$s)]+)(?:%2$s)', tags$[1], tags$[2]),
                                                 'lib_mustache._identity');

    -- Or {{{name}}}
    _output$ = lib_mustache._process_with_regexp(_output$,
                                                 view$,
                                                 format('(?:%1$s{)([^(?:%2$s})]+)(?:}%2$s)', tags$[1], tags$[2]),
                                                 'lib_mustache._identity');

    -- second pass run the escaped interpolations
    -- All variables are HTML escaped by default. If you want to return unescaped HTML, use the triple mustache: {{{name}}}.
    -- @todo optimize this
    _output$ = lib_mustache._process_with_regexp(_output$,
                                                 view$,
                                                 format('(?:%1$s)([^(?:%2$s)]+)(?:%2$s)', tags$[1], tags$[2]),
                                                 'lib_mustache._html_escape');

    return _output$;
end;
$$ language plpgsql;
