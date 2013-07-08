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

rightscale_marker :end
