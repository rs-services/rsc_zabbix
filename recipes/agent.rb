marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

include_recipe "zabbix::agent"
include_recipe "zabbix::agent_registration"
