openresty-rest-api
===

simple rest api example run on [OpenResty](https://www.openresty.org/)

## Usage

1. install OpenResty

2. clone project and run

```
git clone git@github.com:soyking/openresty-rest-api.git
cd openresty-rest-api
nginx -p .
```

3. example in `conf/nginx.conf`

```
curl -d '{"name":"user_1"}' -XPOST 'http://127.0.0.1:8787/rest'
curl 'http://127.0.0.1:8787/rest?name=user_1'
```
