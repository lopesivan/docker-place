#
# Cookbook Name:: root
# Recipe:: default
#
# Copyright 2014, 42 Algoritimos
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("============================================")
Chef::Log.info("Starting Chef Run (Version #{Chef::VERSION})")
current_user = node.user
Chef::Log.info("Current User: #{current_user.name}")
Chef::Log.info("============================================")

node.user.folders.each do |path|
  directory path do
  owner current_user.name
  group current_user.name
  mode 00755
  end
end

# create an authorized_keys file
authorized_keys_file = node.user.authorized_keys
file authorized_keys_file do
  owner current_user.name
  mode  0600
  content "#{node.user.ssh_key} "
  not_if { ::File.exists?("#{authorized_keys_file}")}
end

#cookbook_file node.user.data_bag_secret do
#  source "encrypted_data_bag_secret"
#  owner current_user.name
#  mode "0644"
#end
#
#cookbook_file node.user.knife do
#  source node.user.knife.gsub(/^.*\//, '')
#  owner current_user.name
#  mode "0644"
#end

#node.user.pem.each do |pem|
#  cookbook_file pem do
#  source pem.gsub(/^.*\//, '')
#  owner current_user.name
#  mode "0644"
#  end
#end

