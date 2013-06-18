
# List of all actions supported by the provider
actions :create, :remove

# Make create the default action
default_action :create

# Required attributes
attribute :user_name, :kind_of => String
attribute :vendor, :kind_of => String, 
          :default => "cisco", 
          :equal_to => [ "cisco" ]
attribute :group_name, :kind_of => String, 
          :default => ""
attribute :group_password, :kind_of => String,
          :default => ""
attribute :gateway, :kind_of => String
