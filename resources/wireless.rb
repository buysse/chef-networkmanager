
# List of all actions supported by the provider
actions :create, :remove

# Make create the default action
default_action :create

# Required attributes
attribute :ssid, :kind_of => String
attribute :keytype, :kind_of => String, 
          :default => "wpa-psk", 
          :equal_to => [ "wpa-psk" ]
attribute :auth_alg, :kind_of => String, 
          :equal_to => [ "open" ], 
          :default => "open"
attribute :psk, :kind_of => String
attribute :local_interface, :kind_of => String, 
          :default => "wlan0"

# Optional attributes
attribute :uuid, :kind_of => String
attribute :comment, :kind_of => String
