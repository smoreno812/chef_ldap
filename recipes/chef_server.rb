

file '/etc/opscode/chef-server.rb' do
  content <<-EOF
api_fqdn "#{node['chef_server']['fqdn']}"

oc_id['applications'] = {
  "supermarket"=>{"redirect_uri"=>"https://supermarket.services.com/auth/chef_oauth2/callback"}
}

ldap['system_adjective'] = "#{node['chef_server']['system_adjective']}"
ldap['base_dn'] = "#{node['chef_server']['base_dn']}"
ldap['bind_dn'] = "#{node['chef_server']['bind_dn']}"
ldap['bind_password'] = "#{node['chef_server']['bind_password']}"
ldap['group_dn'] = "#{node['chef_server']['group_dn']}"
ldap['host'] = "#{node['chef_server']['host']}"
ldap['port'] = "#{node['chef_server']['port']}"
ldap['login_attribute'] = "#{node['chef_server']['login_attribute']}"
license['nodes'] = "#{node['chef_server']['nodes']}"

EOF
end


execute 'restart chef-server' do
    command 'chef-server-ctl reconfigure'
  end