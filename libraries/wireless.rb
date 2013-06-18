def get_uuid_or_generate_for(connection_name) 
  if File.exists?("/etc/NetworkManager/system-connections/#{connection_name}") then
    uuid = `grep ^uuid= /etc/NetworkManager/system-connections/#{connection_name} | cut -f2 -d=`
  else
    uuid = `/usr/bin/uuidgen -r`
  end
  return uuid
end

def get_mac_addr_for_interface(interface) 
  mac_address = nil
  begin
    node.network.interfaces.wlan0.addresses.each do |k,v|
      if v.family == 'lladdr'
        mac_address = k
      end
    end
  rescue 
    Chef::Log.warn("Exception caught looking for interface mac address")
  end
  return mac_address
end

    