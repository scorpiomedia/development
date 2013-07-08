#
# Cookbook Name:: lb_nginx
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

include RightScale::LB::Helper

action :install do

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

  # Tags this server as a load balancer for pool it will answer for so app servers
  # can send requests to it.
  # See http://support.rightscale.com/12-Guides/Chef_Cookbooks_Developer_Guide/Chef_Resources#RightLinkTag for the "right_link_tag" resource.
  #pool_name = node[:lb][:pool_name]
  #right_link_tag "loadbalancer:#{pool_name}=lb"
end
