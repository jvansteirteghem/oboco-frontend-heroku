#!/bin/bash

# env

BASE_URL='https://oboco-backend.herokuapp.com'

# replace

sed -i 's,listen .*;,listen '"${PORT}"';,' /etc/nginx/conf.d/default.conf
sed -i 's,/api/v1/,'"${BASE_URL}"'/api/v1/,g' /usr/share/nginx/html/main*.js

# start

nginx -g 'daemon off;'