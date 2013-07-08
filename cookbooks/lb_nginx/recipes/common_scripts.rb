#
# Cookbook Name:: lb_nginx
# Recipe:: common_scripts
#
# Copyright 2013, Scorpio Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

log " Creating common scripts"

%w(nxensite nxdissite).each do |nxscript|
  template "/usr/sbin/#{nxscript}" do
    source "#{nxscript}.erb"
    mode 00755
    owner "root"
    group "root"
  end
end

cookbook_file "/etc/nginx/generate_upstream_config" do
  owner "www-data"
  group "www-data"
  mode "0755"
  source "generate_upstream_config"
  cookbook "lb_nginx"
end

rightscale_marker :end
