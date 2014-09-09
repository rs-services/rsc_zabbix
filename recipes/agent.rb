marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

include_recipe "zabbix::agent"
node.set['zabbix']['web']['fqdn']=node[:zabbix][:agent][:servers].first
include_recipe "zabbix::agent_registration"
