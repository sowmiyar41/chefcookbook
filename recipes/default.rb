#
# Cookbook Name:: chefcookbook
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#INSTALL GIT
package "git" do
 action :install
end

#u01 directory creation
directory node['base']['dir'] do
 owner 'root'
 group 'root'
  mode '0755'
  action :create
end

#/u01/git-repo directory creation
directory node['git']['dir'] do
 owner 'root'
 group 'root'
  mode '0755'
  action :create
end

#Check the chef environment and clone from git repo
if node.chef_environment == "qa"
  git  node['git']['dir'] do
  repository node['git']['url']
  reference "master"
  action :checkout
end
elsif node.chef_environment == "dev"
 directory "/u01/dev" do
 owner 'root'
 group 'root'
  mode '0755'
  action :create
end
else
directory "/u01/qa" do
 owner 'root'
 group 'root'
  mode '0755'
  action :create
end
end
