#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
#
  package 'httpd'

  service 'httpd' do
    action [:start, :enable]
  end
  
  template '/var/www/html/index.html' do
    source 'index.erb'
   end