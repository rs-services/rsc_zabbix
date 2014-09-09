name             'rsc_zabbix'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures rsc_zabbix'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "zabbix"

recipe "rsc_zabbix::default", "installs and configures zabbix"
recipe "rsc_zabbix::agent", "installs the agent"


attribute "zabbix/agent/servers",
  :display_name => "Zabbix Servers",
  :description => "Zabbix Servers",
  :type => "array"
