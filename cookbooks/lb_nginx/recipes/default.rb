#
# Cookbook Name:: lb_nginx
# Recipe:: default
#
# Copyright 2013, Scorpio Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

class Chef::Recipe
  include RightScale::App::Helper
end

log "  Override load balancer to use HAProxy."
node[:lb][:service][:provider] = "lb_haproxy"

log "  Installing nginx"

# Installs Nginx package.
package "nginx" do
  action :install
end

# Creates Nginx service.
service "nginx" do
  supports :reload => true, :restart => true, :status => true, :start => true, :stop => true
  action :enable
end

# Creates some common direcotories
include_recipe "lb_nginx::common_dirs"

# Create enable/disable site scriptt
include_recipe "lb_nginx::common_scripts"

# Create enable/disable site scriptt
include_recipe "lb_nginx::common_confs"

rightscale_marker :end
