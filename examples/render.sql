select lib_mustache.render('<h1>{{&header}}</h1><p>{{&sub.value}}</p>', '{
  "header": "awesome header",
  "sub": {
    "value": "paragraph"
  }
}'::jsonb);
