#
# Cookbook Name:: lb_nginx
# Attributes:: default
#
# Copyright 2013, Scorpio Interactive
#
# All rights reserved - Do Not Redistribute
#

# In order to update the version, the checksum attribute should be
# changed too. Use sha256sum function. It is in the source.rb file, though we recommend
# overriding attributes by modifying a role, or the node itself.

default[:lb_nginx][:etc_dir] = "/etc/nginx"
default[:lb_nginx][:log_dir] = "/var/log/nginx"
default[:lb_nginx][:user] = "www-data"
default[:lb_nginx][:group] = "www-data"
default[:lb_nginx][:pid] = "/var/run/nginx.pid"
default[:lb_nginx][:www_dir] = "/var/www"
default[:lb_nginx][:worker_processes] = node[:cpu] && node[:cpu][:total] ? node[:cpu][:total] : 1
default[:lb_nginx][:worker_rlimit_nofile] = 1024
default[:lb_nginx][:worker_connections] = 1024
default[:lb_nginx][:multi_accept] = "off"

default[:lb_nginx][:log_format] = <<-FORMAT
  '$remote_addr $host $remote_user [$time_local] "$request" '
  '$status $body_bytes_sent "$http_referer" "$http_user_agent" "$gzip_ratio"'
FORMAT

default[:lb_nginx][:sendfile] = "on"
default[:lb_nginx][:tcp_nopush] = "on"
default[:lb_nginx][:tcp_nodelay] = "on"
default[:lb_nginx][:client_body_timeout] = 60
default[:lb_nginx][:client_header_timeout] = 60
default[:lb_nginx][:keepalive_timeout] = 75
default[:lb_nginx][:send_timeout] = 60
default[:lb_nginx][:ignore_invalid_headers] = "off"
default[:lb_nginx][:types_hash_max_size]           = 2048
default[:lb_nginx][:server_tokens]                 = "off"
default[:lb_nginx][:server_names_hash_bucket_size] = 64
default[:lb_nginx][:server_name_in_redirect]       = "off"
default[:lb_nginx][:large_client_header_buffers]   = "4 8k"
default[:lb_nginx][:gzip]                          = "on"
default[:lb_nginx][:gzip_disable]                  = "msie6"
default[:lb_nginx][:gzip_vary]                     = "on"
default[:lb_nginx][:gzip_proxied]                  = "any"
default[:lb_nginx][:gzip_comp_level]               = 6
default[:lb_nginx][:gzip_buffers]                  = "16 8k"
default[:lb_nginx][:gzip_http_version]             = "1.1"
default[:lb_nginx][:gzip_min_length]               = "1024"
default[:lb_nginx][:gzip_types] = [  "text/plain",
                                  "text/css",
                                  "application/json",
                                  "application/x-javascript",
                                  "text/xml",
                                  "application/xml",
                                  "application/xml+rss",
                                  "text/javascript"
                                ]
default[:lb_nginx][:default] = "off"
default[:lb_nginx][:https]   = "on"
default[:lb_nginx][:default_site] = true
default[:lb_nginx][:apps] = {}
default[:lb_nginx][:status][:allow] = "127.0.0.1"
default[:lb_nginx][:status][:deny]  = "all"
default[:lb_nginx][:proxy_cache_dir] = "/usr/share/nginx/cache"
default[:lb_nginx][:proxy_cache] = []
default[:lb_nginx][:real_ip][:header]        = "X-Forwarded-For"
default[:lb_nginx][:real_ip][:trusted_hosts] = %w[10.0.0.0/8 172.16.0.0/12 192.168.0.0/16]
default[:lb_nginx][:proxy][:connect_timeout] = "5s";
default[:lb_nginx][:proxy][:read_timeout] = "60s";
default[:lb_nginx][:proxy][:send_timeout] = "60s";
default[:lb_nginx][:proxy][:redirect] = "off";
default[:lb_nginx][:proxy][:http_version] = "1.1";
default[:lb_nginx][:proxy_headers] = [
  "X-Forwarded-Proto $scheme",
  "X-Forwarded-For $proxy_add_x_forwarded_for",
  "X-Real-IP $remote_addr",
  "Host $host",
  "Connection ''"
]
