rightscale_marker :begin

log " Creating default Nginx configuration file"

template "nginx.conf" do
  path "#{node[:lb_nginx][:etc_dir]}/nginx.conf"
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end
rightscale_marker :ebd
