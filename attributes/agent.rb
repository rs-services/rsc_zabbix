default['zabbix']['agent']['version'] = '2.2.6'
default['zabbix']['web']['fqdn']=node[:zabbix][:agent][:servers]
