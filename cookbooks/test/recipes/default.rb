#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'tar' do
  action :install
end

package 'Install Apache' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'httpd'
  when 'ubuntu', 'debian'
    package_name 'apache2'
  end
end


case node[:platform]
  when 'redhat', 'centos'
    package 'zlib-devel'
    package 'openssl-devel'
  when 'ubuntu', 'debian'
    package 'openssl'
    package 'pkg-config'
    package 'subversion'
end


remote_file '/tmp/sample.war' do
  source 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/tmp/index.php' do
  content '<html>This is a placeholder for the home page.</html>'
  mode '0755'
  owner 'root'
  group 'root'
end

cookbook_file '/tmp/test.php' do
  source 'index.php'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
remote_file '/tmp/master.zip' do
  source 'https://github.com/yvdvarma/chef-repo/archive/master.zip'
  action :create
end
template '/etc/motd' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template '/tmp/locavar' do
  source 'local.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(myname: "Vikram")
end

package 'ntpd' do
  action :install
  ignore_failure true
end

template '/tmp/somefile' do
  mode '0755'
  source 'somefile.erb'
  #not_if { node['test']['some_value'] }
  only_if { node['test']['some_value'] }
end

service 'httpd' do
  action [:start, :enable]
end
