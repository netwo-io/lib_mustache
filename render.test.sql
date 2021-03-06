--
-- whole test suite generated from mustache.js
--

create or replace function lib_test.test_case_lib_mustacheampersand_escape() returns void as
$$
declare
begin
    perform lib_test.assert_equal(lib_mustache.render($_${{&message}}
$_$, $_${
      "message": "Some <code>"
    }$_$::jsonb), $_$Some <code>
$_$);
end;
$$ language plpgsql;


-- create or replace function lib_test.test_case_lib_mustacheapostrophe() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{apos}}{{control}}
-- $_$, $_${"apos":"'","control":"X"}$_$::jsonb), $_$&#39;X
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachearray_of_strings() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#array_of_strings}}{{.}} {{/array_of_strings}}
-- $_$, $_${"array_of_strings":["hello","world"]}$_$::jsonb), $_$hello world
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheavoids_obj_prototype_in_view_cache() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{valueOf}} {{watch}}$_$, $_${"valueOf":"Avoids methods","watch":"in Object.prototype"}$_$::jsonb), $_$Avoids methods in Object.prototype$_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachebackslashes() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$* {{value}}
-- * {{{value}}}
-- * {{&value}}
-- <script>
-- foo = { bar: 'abc\"xyz\"' };
-- foo = { bar: 'x\'y' };
-- </script>
-- $_$, $_${"value":"\\abc"}$_$::jsonb), $_$* \abc
-- * \abc
-- * \abc
-- <script>
-- foo = { bar: 'abc\"xyz\"' };
-- foo = { bar: 'x\'y' };
-- </script>
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachebug_11_eating_whitespace() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{tag}} foo
-- $_$, $_${"tag":"yo"}$_$::jsonb), $_$yo foo
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachebug_length_property() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#length}}The length variable is: {{length}}{{/length}}
-- $_$, $_${"length":"hello"}$_$::jsonb), $_$The length variable is: hello
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachechanging_delimiters() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{=<% %>=}}<% foo %> {{foo}} <%{bar}%> {{{bar}}}
-- $_$, $_${"foo":"foooooooooooooo","bar":"<b>bar!</b>"}$_$::jsonb), $_$foooooooooooooo {{foo}} <b>bar!</b> {{{bar}}}
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachecheck_falsy() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$<p>{{#number}}0{{/number}}</p>
-- $_$, $_${}$_$::jsonb), $_$<p>0</p>
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachecli_js_view_with_function() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#bold}}Hi {{name}}.{{/bold}}$_$, $_${"name":"Tater"}$_$::jsonb), $_$<b>Hi Tater.</b>$_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachecomments() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$<h1>{{title}}{{! just something interesting... or not... }}</h1>
-- $_$, $_${}$_$::jsonb), $_$<h1>A Comedy of Errors</h1>
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachecomplex() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$<h1>{{header}}</h1>
-- {{#list}}
--   <ul>
--   {{#item}}
--   {{#current}}
--   <li><strong>{{name}}</strong></li>
--   {{/current}}
--   {{#link}}
--   <li><a href="{{url}}">{{name}}</a></li>
--   {{/link}}
--   {{/item}}
--   </ul>
-- {{/list}}
-- {{#empty}}
--   <p>The list is empty.</p>
-- {{/empty}}
-- $_$, $_${"item":[{"name":"red","current":true,"url":"#Red"},{"name":"green","current":false,"url":"#Green"},{"name":"blue","current":false,"url":"#Blue"}]}$_$::jsonb), $_$<h1>Colors</h1>
--   <ul>
--   <li><strong>red</strong></li>
--   <li><a href="#Green">green</a></li>
--   <li><a href="#Blue">blue</a></li>
--   </ul>
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachecontext_lookup() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#outer}}{{#second}}{{id}}{{/second}}{{/outer}}
-- $_$, $_${"outer":{"id":1,"second":{"nothing":2}}}$_$::jsonb), $_$1
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachedelimiters() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{=<% %>=}}*
-- <% first %>
-- * <% second %>
-- <%=| |=%>
-- * | third |
-- |={{ }}=|
-- * {{ fourth }}
-- $_$, $_${"first":"It worked the first time.","second":"And it worked the second time.","third":"Then, surprisingly, it worked the third time.","fourth":"Fourth time also fine!."}$_$::jsonb), $_$*
-- It worked the first time.
-- * And it worked the second time.
-- * Then, surprisingly, it worked the third time.
-- * Fourth time also fine!.
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachedisappearing_whitespace() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#bedrooms}}{{total}}{{/bedrooms}} BED
-- $_$, $_${"bedrooms":true,"total":1}$_$::jsonb), $_$1 BED
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachedot_notation() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$<!-- exciting part -->
-- <h1>{{name}}</h1>
-- <p>Authors: <ul>{{#authors}}<li>{{.}}</li>{{/authors}}</ul></p>
-- <p>Price: {{{price.currency.symbol}}}{{price.value}} {{#price.currency}}{{name}} <b>{{availability.text}}</b>{{/price.currency}}</p>
-- <p>VAT: {{{price.currency.symbol}}}{{#price}}{{vat}}{{/price}}</p>
-- <!-- boring part -->
-- <h2>Test truthy false values:</h2>
-- <p>Zero: {{truthy.zero}}</p>
-- <p>False: {{truthy.notTrue}}</p>
-- <p>length of string should be rendered: {{price.currency.name.length}}</p>
-- <p>length of string in a list should be rendered: {{#singletonList}}{{singletonItem.length}}{{/singletonList}}</p>
-- <p>length of an array should be rendered: {{authors.length}}</p>
-- $_$, $_${"name":"A Book","authors":["John Power","Jamie Walsh"],"price":{"value":200,"currency":{"symbol":"$","name":"USD"}},"availability":{"status":true,"text":"In Stock"},"truthy":{"zero":0,"notTrue":false},"singletonList":[{"singletonItem":"singleton item"}]}$_$::jsonb), $_$<!-- exciting part -->
-- <h1>A Book</h1>
-- <p>Authors: <ul><li>John Power</li><li>Jamie Walsh</li></ul></p>
-- <p>Price: $200 USD <b>In Stock</b></p>
-- <p>VAT: $40</p>
-- <!-- boring part -->
-- <h2>Test truthy false values:</h2>
-- <p>Zero: 0</p>
-- <p>False: false</p>
-- <p>length of string should be rendered: 3</p>
-- <p>length of string in a list should be rendered: 14</p>
-- <p>length of an array should be rendered: 2</p>
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachedouble_render() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#foo}}{{bar}}{{/foo}}
-- $_$, $_${"foo":true,"bar":"{{win}}","win":"FAIL"}$_$::jsonb), $_${{win}}
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheempty_list() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$These are the jobs:
-- {{#jobs}}
-- {{.}}
-- {{/jobs}}
-- $_$, $_${"jobs":[]}$_$::jsonb), $_$These are the jobs:
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheempty_sections() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#foo}}{{/foo}}foo{{#bar}}{{/bar}}
-- $_$, $_${}$_$::jsonb), $_$foo
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheempty_string() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{description}}{{#child}}{{description}}{{/child}}
-- $_$, $_${"description":"That is all!","child":{"description":""}}$_$::jsonb), $_$That is all!
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheempty_template() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$<html><head></head><body><h1>Test</h1></body></html>$_$, $_${}$_$::jsonb), $_$<html><head></head><body><h1>Test</h1></body></html>$_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheerror_not_found() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{foo}}$_$, $_${"bar":2}$_$::jsonb), '');
--     end;
--     $$ language plpgsql;
--
create or replace function lib_test.test_case_lib_mustacheescaped() returns void as
    -- edited because we won't support function inside json
$$
declare
begin
    perform lib_test.assert_equal(lib_mustache.render($_$<h1>{{title}}{{symbol}}</h1>
And even {{entities}}, but not {{{entities}}}.
$_$, $_${
      "title": "Bear > Shark",
      "symbol": null,
      "entities": "&quot; \"'<>`=/"
    }$_$::jsonb), $_$<h1>Bear &gt; Shark</h1>
And even &amp;quot; &quot;&#39;&lt;&gt;&#x60;&#x3D;&#x2F;, but not &quot; "'<>`=/.
$_$);
end;
$$ language plpgsql;

--
-- create or replace function lib_test.test_case_lib_mustachefalsy() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#emptyString}}empty string{{/emptyString}}
-- {{^emptyString}}inverted empty string{{/emptyString}}
-- {{#emptyArray}}empty array{{/emptyArray}}
-- {{^emptyArray}}inverted empty array{{/emptyArray}}
-- {{#zero}}zero{{/zero}}
-- {{^zero}}inverted zero{{/zero}}
-- {{#null}}null{{/null}}
-- {{^null}}inverted null{{/null}}
-- {{#undefined}}undefined{{/undefined}}
-- {{^undefined}}inverted undefined{{/undefined}}
-- {{#NaN}}NaN{{/NaN}}
-- {{^NaN}}inverted NaN{{/NaN}}
-- $_$, $_${"emptyString":"","emptyArray":[],"zero":0,"null":null,"NaN":null}$_$::jsonb), $_$
-- inverted empty string
--
-- inverted empty array
--
-- inverted zero
--
-- inverted null
--
-- inverted undefined
--
-- inverted NaN
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachefalsy_array() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#list}}
-- {{#.}}{{#.}}{{.}}{{/.}}{{^.}}inverted {{/.}}{{/.}}
-- {{/list}}$_$, $_${"list":[["","emptyString"],[[],"emptyArray"],[0,"zero"],[null,"null"],[null,"undefined"],[null,"NaN"]]}$_$::jsonb), $_$inverted emptyString
-- inverted emptyArray
-- inverted zero
-- inverted null
-- inverted undefined
-- inverted NaN
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachegrandparent_context() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{grand_parent_id}}
-- {{#parent_contexts}}
-- {{grand_parent_id}}
-- {{parent_id}}
-- {{#child_contexts}}
-- {{grand_parent_id}}
-- {{parent_id}}
-- {{child_id}}
-- {{/child_contexts}}
-- {{/parent_contexts}}
-- $_$, $_${"grand_parent_id":"grand_parent1","parent_contexts":[{"parent_id":"parent1","child_contexts":[{"child_id":"parent1-child1"},{"child_id":"parent1-child2"}]},{"parent_id":"parent2","child_contexts":[{"child_id":"parent2-child1"},{"child_id":"parent2-child2"}]}]}$_$::jsonb), $_$grand_parent1
-- grand_parent1
-- parent1
-- grand_parent1
-- parent1
-- parent1-child1
-- grand_parent1
-- parent1
-- parent1-child2
-- grand_parent1
-- parent2
-- grand_parent1
-- parent2
-- parent2-child1
-- grand_parent1
-- parent2
-- parent2-child2
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachehigher_order_sections() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#bolder}}Hi {{name}}.{{/bolder}}
-- $_$, $_${"name":"Tater","helper":"To tinker?"}$_$::jsonb), $_$Hi {{name}}. => <b>Hi Tater.</b> To tinker?
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheimplicit_iterator() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{# data.author.twitter_id }}
-- <meta name="twitter:site:id" content="{{.}}">
-- {{/ data.author.twitter_id }}
--
-- {{# data.author.name }}
-- <meta name="twitter:site" content="{{.}}">
-- {{/ data.author.name }}
-- $_$, $_${"data":{"author":{"twitter_id":819606,"name":"janl"}}}$_$::jsonb), $_$<meta name="twitter:site:id" content="819606">
--
-- <meta name="twitter:site" content="janl">
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheincluded_tag() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$You said "{{{html}}}" today
-- $_$, $_${"html":"I like {{mustache}}"}$_$::jsonb), $_$You said "I like {{mustache}}" today
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheinverted_section() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#repos}}<b>{{name}}</b>{{/repos}}
-- {{^repos}}No repos :({{/repos}}
-- {{^nothin}}Hello!{{/nothin}}
-- $_$, $_${"repos":[]}$_$::jsonb), $_$
-- No repos :(
-- Hello!
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachekeys_with_questionmarks() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#person?}}
--   Hi {{name}}!
-- {{/person?}}
-- $_$, $_${"person?":{"name":"Jon"}}$_$::jsonb), $_$  Hi Jon!
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachemalicious_template() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{"+(function () {throw "evil"})()+"}}
-- {{{"+(function () {throw "evil"})()+"}}}
-- {{> "+(function () {throw "evil"})()+"}}
-- {{# "+(function () {throw "evil"})()+"}}
-- {{/ "+(function () {throw "evil"})()+"}}
-- $_$, $_${}$_$::jsonb), '');
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachemultiline_comment() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{!
--
-- This is a multi-line comment.
--
-- }}
-- Hello world!
-- $_$, $_${}$_$::jsonb), $_$Hello world!
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachenested_dot() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#name}}Hello {{.}}{{/name}}$_$, $_${"name":"Bruno"}$_$::jsonb), $_$Hello Bruno$_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachenested_higher_order_sections() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#bold}}{{#person}}My name is {{name}}!{{/person}}{{/bold}}
-- $_$, $_${"person":{"name":"Jonas"}}$_$::jsonb), $_$<b>My name is Jonas!</b>
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachenested_iterating() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#inner}}{{foo}}{{#inner}}{{bar}}{{/inner}}{{/inner}}
-- $_$, $_${"inner":[{"foo":"foo","inner":[{"bar":"bar"}]}]}$_$::jsonb), $_$foobar
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachenesting() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#foo}}
--   {{#a}}
--     {{b}}
--   {{/a}}
-- {{/foo}}
-- $_$, $_${"foo":[{"a":{"b":1}},{"a":{"b":2}},{"a":{"b":3}}]}$_$::jsonb), $_$    1
--     2
--     3
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachenesting_same_name() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#items}}{{name}}{{#items}}{{.}}{{/items}}{{/items}}
-- $_$, $_${"items":[{"name":"name","items":[1,2,3,4]}]}$_$::jsonb), $_$name1234
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachenull_lookup_array() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#farray}}
-- {{#.}}{{#.}}{{.}} {{/.}}{{^.}}no twitter{{/.}}{{/.}}
-- {{/farray}}
-- $_$, $_${"name":"David","twitter":"@dasilvacontin","farray":[["Flor","@florrts"],["Miquel",null],["Chris",null]]}$_$::jsonb), $_$Flor @florrts
-- Miquel no twitter
-- Chris no twitter
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachenull_lookup_object() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#fobject}}
-- {{name}}'s twitter: {{#twitter}}{{.}}{{/twitter}}{{^twitter}}unknown{{/twitter}}.
-- {{/fobject}}
--
-- {{#mascot}}
-- {{name}}'s favorite color: {{#favorites.color}}{{.}}{{/favorites.color}}{{^favorites.color}}no one{{/favorites.color}}.
-- {{name}}'s favorite president: {{#favorites.president}}{{.}}{{/favorites.president}}{{^favorites.president}}no one{{/favorites.president}}.
-- {{name}}'s favorite show: {{#favorites.show}}{{.}}{{/favorites.show}}{{^favorites.show}}none{{/favorites.show}}.
-- {{/mascot}}
-- $_$, $_${"name":"David","twitter":"@dasilvacontin","fobject":[{"name":"Flor","twitter":"@florrts"},{"name":"Miquel","twitter":null},{"name":"Chris"}],"favorites":{"color":"blue","president":"Bush","show":"Futurama"},"mascot":{"name":"Squid","favorites":{"color":"orange","show":null}}}$_$::jsonb), $_$Flor's twitter: @florrts.
-- Miquel's twitter: unknown.
-- Chris's twitter: unknown.
--
-- Squid's favorite color: orange.
-- Squid's favorite president: no one.
-- Squid's favorite show: none.
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachenull_string() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$Hello {{name}}
-- glytch {{glytch}}
-- binary {{binary}}
-- value {{value}}
-- undef {{undef}}
-- numeric {{numeric}}
-- $_$, $_${"name":"Elise","glytch":true,"binary":false,"value":null}$_$::jsonb), $_$Hello Elise
-- glytch true
-- binary false
-- value
-- undef
-- numeric NaN
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachenull_view() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{name}}'s friends: {{#friends}}{{name}}, {{/friends}}$_$, $_${"name":"Joe","friends":null}$_$::jsonb), $_$Joe's friends:$_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacherecursion_with_same_names() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{ name }}
-- {{ description }}
--
-- {{#terms}}
--   {{name}}
--   {{index}}
-- {{/terms}}
-- $_$, $_${"name":"name","description":"desc","terms":[{"name":"t1","index":0},{"name":"t2","index":1}]}$_$::jsonb), $_$name
-- desc
--
--   t1
--   0
--   t2
--   1
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachereuse_of_enumerables() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#terms}}
--   {{name}}
--   {{index}}
-- {{/terms}}
-- {{#terms}}
--   {{name}}
--   {{index}}
-- {{/terms}}
-- $_$, $_${"terms":[{"name":"t1","index":0},{"name":"t2","index":1}]}$_$::jsonb), $_$  t1
--   0
--   t2
--   1
--   t1
--   0
--   t2
--   1
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachesection_as_context() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#a_object}}
--   <h1>{{title}}</h1>
--   <p>{{description}}</p>
--   <ul>
--     {{#a_list}}
--     <li>{{label}}</li>
--     {{/a_list}}
--   </ul>
-- {{/a_object}}
-- $_$, $_${"a_object":{"title":"this is an object","description":"one of its attributes is a list","a_list":[{"label":"listitem1"},{"label":"listitem2"}]}}$_$::jsonb), $_$  <h1>this is an object</h1>
--   <p>one of its attributes is a list</p>
--   <ul>
--     <li>listitem1</li>
--     <li>listitem2</li>
--   </ul>
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachesimple() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$Hello {{name}}
-- You have just won ${{value}}!
-- {{#in_ca}}
-- Well, ${{ taxed_value }}, after taxes.
-- {{/in_ca}}
-- $_$, $_${"name":"Chris","value":10000,"in_ca":true}$_$::jsonb), $_$Hello Chris
-- You have just won $10000!
-- Well, $6000, after taxes.
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachestring_as_context() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$<ul>
-- {{#a_list}}
--   <li>{{a_string}}/{{.}}</li>
-- {{/a_list}}
-- </ul>$_$, $_${"a_string":"aa","a_list":["a","b","c"]}$_$::jsonb), $_$<ul>
--   <li>aa/a</li>
--   <li>aa/b</li>
--   <li>aa/c</li>
-- </ul>$_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachetwo_in_a_row() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{greeting}}, {{name}}!
-- $_$, $_${"name":"Joe","greeting":"Welcome"}$_$::jsonb), $_$Welcome, Joe!
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustachetwo_sections() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#foo}}
-- {{/foo}}
-- {{#bar}}
-- {{/bar}}
-- $_$, $_${}$_$::jsonb), '');
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheunescaped() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$<h1>{{{title}}}{{{symbol}}}</h1>
-- $_$, $_${"symbol":null}$_$::jsonb), $_$<h1>Bear > Shark</h1>
-- $_$);
--     end;
--     $$ language plpgsql;
--
-- create or replace function lib_test.test_case_lib_mustacheuses_props_from_view_prototype() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_$[{{ item.x }};{{ item.y }}]||{{#items}}[{{ a.x }};{{ a.y }} {{#a}}{{y}}{{/a}}]{{/items}}$_$, $_${"item":{"x":"0","_y":"00"},"items":[{"a":{"x":"1","_y":"2"}},{"a":{"x":"3","_y":"4"}}]}$_$::jsonb), $_$[0;00]||[1;2 2][3;4 4]$_$);
--     end;
--     $$ language plpgsql;


create or replace function lib_test.test_case_lib_mustachewhitespace() returns void as
$$
declare
begin
    perform lib_test.assert_equal(lib_mustache.render($_${{tag1}}


{{tag2}}.
$_$, $_${
      "tag1": "Hello",
      "tag2": "World"
    }$_$::jsonb), $_$Hello


World.
$_$);
end;
$$ language plpgsql;

--
-- create or replace function lib_test.test_case_lib_mustachezero_view() returns void as
--     $$
--     declare
--     begin
--       perform lib_test.assert_equal(lib_mustache.render($_${{#nums}}{{.}},{{/nums}}$_$, $_${"nums":[0,1,2]}$_$::jsonb), $_$0,1,2,$_$);
--     end;
--     $$ language plpgsql;
