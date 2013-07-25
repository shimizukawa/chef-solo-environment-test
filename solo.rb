root = File.expand_path(File.dirname(__FILE__))
file_cache_path "/var/chef/cache"
cookbook_path ["./cookbooks"].collect{|dir| File.join(root, dir)}
role_path File.join(root, "./roles")
data_bag_path File.join(root, "./data_bags")
verbose_logging true
environment_path File.join(root, "./environments")
environment "personal"
