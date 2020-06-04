drop schema if exists lib_mustache cascade;
create schema lib_mustache;
grant usage on schema lib_mustache to public;
set search_path to pg_catalog;

\ir render.sql
