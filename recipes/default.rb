#
# Cookbook Name:: chefcookbook
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "git" do
 action :install
end

directory node['base']['dir'] do
 owner 'root'
 group 'root'
  mode '0755'
  action :create
end

directory node['git']['dir'] do
 owner 'root'
 group 'root'
  mode '0755'
  action :create
end


git  node['git']['dir'] do
  repository node['git']['url']
  reference "master"
  action :checkout
end

