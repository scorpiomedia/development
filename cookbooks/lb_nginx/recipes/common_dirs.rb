#
# Cookbook Name:: lb_nginx
# Recipe:: commons_dirs
#
# Copyright 2013, Scorpio Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

log " Creating common directories"

directory node[:lb_nginx][:etc_dir] do
  owner "root"
  group "root"
  mode 00755
  recursive true
end

directory node[:lb_nginx][:log_dir] do
  mode 00755
  owner node[:lb_nginx]['user']
  action :create
  recursive true
end

#directory node[:lb_nginx][:www_dir] do
#  mode 00755
#  owner node[:lb_nginx][:user]
#  action :create
#  recursive true
#end

%w(vhosts sites-available sites-enabled conf.d).each do |leaf|
  directory File.join(node[:lb_nginx][:etc_dir], leaf) do
    owner "root"
    group "root"
    mode 00755
  end
end

rightscale_marker :end
