# Docker-Nginx-Golang

## Table of Contents

- [Description](#description)


## Description
NGINX Playground

Add location based config and return a 404. Any content that ends with "css, jpg, jpeg, js, json, png, mp4, pdf" should
return a 404 with curl.

```
location ~* \.(css|jpg|jpeg|js|json|png|mp4|pdf)$ {
        return 404;
    }

sh validation.sh

http://localhost:6000/test.css
HTTP/1.1 404 Not Found
Server: nginx/1.25.2
Date: Sat, 21 Oct 2023 04:15:08 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive

http://localhost:6000/test.jpg
HTTP/1.1 404 Not Found
Server: nginx/1.25.2
Date: Sat, 21 Oct 2023 04:15:09 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive

http://localhost:6000/test.jpeg
HTTP/1.1 404 Not Found
Server: nginx/1.25.2
Date: Sat, 21 Oct 2023 04:15:09 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive

http://localhost:6000/test.js
HTTP/1.1 404 Not Found
Server: nginx/1.25.2
Date: Sat, 21 Oct 2023 04:15:09 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive

http://localhost:6000/test.json
HTTP/1.1 404 Not Found
Server: nginx/1.25.2
Date: Sat, 21 Oct 2023 04:15:09 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive

http://localhost:6000/test.png
HTTP/1.1 404 Not Found
Server: nginx/1.25.2
Date: Sat, 21 Oct 2023 04:15:09 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive

http://localhost:6000/test.mp4
HTTP/1.1 404 Not Found
Server: nginx/1.25.2
Date: Sat, 21 Oct 2023 04:15:09 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive

http://localhost:6000/test.pdf
HTTP/1.1 404 Not Found
Server: nginx/1.25.2
Date: Sat, 21 Oct 2023 04:15:09 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive



```


Log below fields in access log.
Time
Nginx Version
Remote Address
Request ID
Status
Body Bytes Sent
User Agent
Proxy Protocol Address
Server Name
Upstream address
Request Time
Upstream Connect Time
Upstream Header Time
Upstream Response Time
Request URI
Upstream Status
SSL Session reused
X-Forwarded-For

```
log_format custom_log '$time_local '
                         'nginx_version="$nginx_version" '
                         'remote_addr="$remote_addr" '
                         'request_id="$request_id" '
                         'status=$status '
                         'body_bytes_sent=$body_bytes_sent '
                         'http_user_agent="$http_user_agent" '
                         'proxy_protocol_addr="$proxy_protocol_addr" '
                         'server_name="$host" '
                         'upstream_addr="$upstream_addr" '
                         'request_time=$request_time '
                         'upstream_connect_time=$upstream_connect_time '
                         'upstream_header_time=$upstream_header_time '
                         'upstream_response_time=$upstream_response_time '
                         'request_uri="$request_uri" '
                         'upstream_status=$upstream_status '
                         'ssl_session_reused="$ssl_session_reused" '
                         'x_forwarded_for="$http_x_forwarded_for"';

nginx_1       | 21/Oct/2023:04:15:09 +0000 nginx_version="1.25.2" remote_addr="172.18.0.1" request_id="67ed1a960e33b8b1398f90d7d389c7da" status=404 body_bytes_sent=0 http_user_agent="curl/7.84.0" proxy_protocol_addr="-" server_name="localhost" upstream_addr="-" request_time=0.000 upstream_connect_time=- upstream_header_time=- upstream_response_time=- request_uri="/test.js" upstream_status=- ssl_session_reused="-" x_forwarded_for="-"
nginx_1       | 21/Oct/2023:04:15:09 +0000 nginx_version="1.25.2" remote_addr="172.18.0.1" request_id="5f68853e536a94a8a9f3888a2f4b352d" status=404 body_bytes_sent=0 http_user_agent="curl/7.84.0" proxy_protocol_addr="-" server_name="localhost" upstream_addr="-" request_time=0.000 upstream_connect_time=- upstream_header_time=- upstream_response_time=- request_uri="/test.json" upstream_status=- ssl_session_reused="-" x_forwarded_for="-"
nginx_1       | 21/Oct/2023:04:15:09 +0000 nginx_version="1.25.2" remote_addr="172.18.0.1" request_id="68c8e8c5bb52c818a3073c245c0a64bc" status=404 body_bytes_sent=0 http_user_agent="curl/7.84.0" proxy_protocol_addr="-" server_name="localhost" upstream_addr="-" request_time=0.000 upstream_connect_time=- upstream_header_time=- upstream_response_time=- request_uri="/test.png" upstream_status=- ssl_session_reused="-" x_forwarded_for="-"
nginx_1       | 21/Oct/2023:04:15:09 +0000 nginx_version="1.25.2" remote_addr="172.18.0.1" request_id="d95e2b157f6a1872a283a9ad88ee59d0" status=404 body_bytes_sent=0 http_user_agent="curl/7.84.0" proxy_protocol_addr="-" server_name="localhost" upstream_addr="-" request_time=0.000 upstream_connect_time=- upstream_header_time=- upstream_response_time=- request_uri="/test.mp4" upstream_status=- ssl_session_reused="-" x_forwarded_for="-"
nginx_1       | 21/Oct/2023:04:15:09 +0000 nginx_version="1.25.2" remote_addr="172.18.0.1" request_id="05524c9b0897efc5f438597fda93de48" status=404 body_bytes_sent=0 http_user_agent="curl/7.84.0" proxy_protocol_addr="-" server_name="localhost" upstream_addr="-" request_time=0.000 upstream_connect_time=- upstream_header_time=- upstream_response_time=- request_uri="/test.pdf" upstream_status=- ssl_session_reused="-" x_forwarded_for="-"



```



3. Add HTTP security headers at NGINX only if header value is not set in response from the upstream. Default is set to
none and only set in case nothing is returned from the upstream.
HTTP Headers Value
Strict-Transport-Security max-age=31536000; includeSubDomains
X-Content-Type-Options nosniff
X-XSS-Protection 1; mode=block
X-Frame-Options DENY
Content-Security-Policy frame-ancestors 'none'
Access-Control-Allow-Credentials TRUE

```
## headers.map
map $upstream_http_strict_transport_security $sts_header {
        default "max-age=31536000; includeSubDomains";
        "" "max-age=31536000; includeSubDomains";
    }

    map $upstream_http_x_content_type_options $xcto_header {
        default "nosniff";
        "" "nosniff";
    }

    map $upstream_http_x_xss_protection $xxp_header {
        default "1; mode=block";
        "" "1; mode=block";
    }

    map $upstream_http_x_frame_options $xfo_header {
        default "DENY";
        "" "DENY";
    }

    map $upstream_http_content_security_policy $csp_header {
        default "frame-ancestors 'none'";
        "" "frame-ancestors 'none'";
    }

    map $upstream_http_access_control_allow_credentials $acac_header {
        default "TRUE";
        "" "TRUE";
    }


if ($upstream_http_custom_header = "") {
            add_header Strict-Transport-Security $sts_header always;
            add_header X-Content-Type-Options $xcto_header always;
            add_header X-XSS-Protection $xxp_header always;
            add_header X-Frame-Options $xfo_header always;
            add_header Content-Security-Policy $csp_header always;
            add_header Access-Control-Allow-Credentials $acac_header always;

        }

└─(23:16:33 on main ✹ ✭)──> curl -I http:localhost:6000/    ──(Fri,Oct20)─┘
HTTP/1.1 200 OK
Server: nginx/1.25.2
Date: Sat, 21 Oct 2023 04:16:41 GMT
Content-Type: text/plain; charset=utf-8
Content-Length: 13
Connection: keep-alive
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type-Options: nosniff
X-XSS-Protection: 1; mode=block
X-Frame-Options: DENY
Content-Security-Policy: frame-ancestors 'none'
Access-Control-Allow-Credentials: TRUE


All the configurations are in below structure


```


## Structure

├── README.md
├── docker-compose.yml
├── golang-app
│   ├── Dockerfile
│   ├── go.mod
│   └── main.go
└── nginx
    ├── Dockerfile
    ├── headers.map
    ├── main.conf
    └── nginx.conf

-

## Usage

```
docker-compose build
docker-compose up

```
