def whyrun_supported? 
  true
end

action :create do
  if new_resource.uuid.nil? then
    new_resource.uuid(get_uuid_or_generate_for(new_resource.name))
  end
  mac_address = get_mac_addr_for_interface(new_resource.interface)
  if mac_address.nil? then
    Chef::Log.error("No address found for interface #{new_resource.interface}")
    Chef::Application.fatal!("Unable to find address for interface in node data")
  end
  t = template "/etc/NetworkManager/system-connections/#{new_resource.name}" do 
    source "wireless_connection.erb"
    cookbook "networkmanager"
    mode "0600"
    owner "root"
    group "root"
    variables({:res => new_resource, :mac_address => mac_address})
  end
  new_resource.updated_by_last_action(t.updated_by_last_action?)
end

# Removes an entry from the hosts file. Does nothing if the entry does
# not exist.
action :remove do
  f = file "/etc/NetworkManager/system-connections/#{new_resource.name}" do 
    action :delete
  end

  new_resource.updated_by_last_action(f.updated_by_last_action?)
end
