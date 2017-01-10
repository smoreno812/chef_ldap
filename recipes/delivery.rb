file '/etc/delivery/delivery.rb' do
  content <<-EOF
delivery_fqdn "#{node['chef_automate']['fqdn']}"
delivery['chef_username']    = "delivery"
delivery['chef_private_key'] = "/etc/delivery/delivery.pem"
delivery['chef_server']      = "https://#{node['chef_server']['fqdn']}/organizations/delivery"
delivery['default_search']   = "tags:delivery-build-node"
insights['enable']           = true

delivery['ldap_hosts'] = #{node['chef_server']['ldap_hosts']}
delivery['ldap_port'] = "#{node['chef_server']['ldap_port']}"
delivery['ldap_timeout'] = "#{node['chef_server']['ldap_timeout']}"
delivery['ldap_base_dn'] = "#{node['chef_server']['ldap_base_dn']}"
delivery['ldap_bind_dn'] = "#{node['chef_server']['ldap_bind_dn']}"
delivery['ldap_bind_dn_password'] = "#{node['chef_server']['ldap_bind_dn_password']}"
delivery['ldap_encryption'] = "#{node['chef_server']['ldap_encryption']}"
delivery['ldap_attr_login'] = "#{node['chef_server']['ldap_attr_login']}"
delivery['ldap_attr_mail'] = "#{node['chef_server']['ldap_attr_mail']}"
delivery['ldap_attr_full_name'] = "#{node['chef_server']['ldap_attr_full_name']}"


  EOF
end

execute 'restart chef-delivery' do
  command 'automate-ctl reconfigure'
end