# Cookbook Name:: rsc_zabbix
# Recipe:: default
#
# Copyright (C) 2014 RightScale Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

marker "recipe_start_rightscale" do
  emplate "rightscale_audit_entry.erb"
end

package "mysql-devel" do
  action :install
end

include_recipe "mysql::server"
include_recipe "zabbix::default"
include_recipe "zabbix::database"
include_recipe "zabbix::server"
include_recipe "php::default"
include_recipe "zabbix::web"

cookbook_file "/etc/httpd/mods-available/php5.load" do
  source "php5.load"
  owner "root"
  group "root"
  mode "0644"
  action :create
end

cookbook_file "/etc/httpd/mods-available/php5.conf" do
  source "php5.conf"
  owner "root"
  group "root"
  mode "0644"
  action :create
end

execute "a2enmod php5" do
  command "/usr/sbin/a2enmod php5"
  notifies :reload, 'service[apache2]', :delayed
end
