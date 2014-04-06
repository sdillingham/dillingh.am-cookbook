#
# Cookbook Name:: nginx-app
# Recipe:: default
#

include_recipe 'nginx'
 
begin
  t = resources("template[#{node['nginx']['dir']}/sites-available/default]")
  t.source "default-site.erb"
  t.cookbook "nginx-app"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "could not find template your template override!"
end