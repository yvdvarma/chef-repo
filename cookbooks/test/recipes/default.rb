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
