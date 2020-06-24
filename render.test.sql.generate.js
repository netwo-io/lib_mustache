// usage: node render.test.sql.generate.js > render.test.sql
// re-generate render.test.sql


const fs = require('fs');
const path = require('path');
const FIXTURES_PATH = path.resolve(__dirname, '_files');

const files = fs.readdirSync(FIXTURES_PATH).filter(file => !file.startsWith('_'));

function group_by(f){
  return (memo, file) => {
    const key = f(file);
    if(!memo.hasOwnProperty(key)){
     memo[key] = [];
    }

    memo[key].push(file);

    return memo;
  };
}

const get_filename = (file) => path.basename(file, path.extname(file));

const tests = files.reduce(group_by(get_filename), {});

const is_supported_test_files = ([test_name, files]) => files.every(file => file.endsWith('.txt') || file.endsWith('.mustache') || file.endsWith('.js') );
const is_supported_test = ({test_name, files, js}) => !js.includes('function');

const read_fixture = (test_name, ext) => fs.readFileSync(path.join(FIXTURES_PATH, `${test_name}.${ext}`), 'utf8');

const escape = (str) => str.length > 0 ? `$_$${str}$_$` : `''`;

const tests_sql = Object.entries(tests)
  .filter(is_supported_test_files)
  .map(([test_name, files]) => {
    return {
      test_name,
      files,
      txt: read_fixture(test_name, 'txt'),
      js: JSON.stringify(eval(read_fixture(test_name, 'js'))),
      mustache: read_fixture(test_name, 'mustache'),
    };
  })
  .filter(is_supported_test)
  .map(({test_name, txt, js, mustache}) => {

    return `create or replace function lib_test.test_case_lib_mustache${test_name}() returns void as
    $$
    declare
    begin
      perform lib_test.assert_equal(lib_mustache.render(${escape(mustache)}, ${escape(js)}::jsonb), ${escape(txt)});
    end;
    $$ language plpgsql;
    `
  })
  .join('\n');

console.log(tests_sql);
