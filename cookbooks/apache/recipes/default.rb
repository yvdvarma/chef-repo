#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
#
#  package 'httpd'

# service 'httpd' do
#    action [:start, :enable]
#    only_if { index_exists? }
#  end

#  package platform_package_httpd

#  service platform_service_httpd do
#      action [:enable, :start]
#   end
  
#  template '/var/www/html/index.html' do
#    source 'index.erb'
#   end
#
hello_httpd 'greet world' do
  greeting "Hello"
  action :create
end
