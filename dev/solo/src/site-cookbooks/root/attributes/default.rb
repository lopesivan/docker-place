default['user']['name'] = "root"
default['user']['folders'] = %w[ /root/.ssh
                                 /.chef
                                 /.chef/data_bags
                                 /.chef/checksums
                                 /.chef/syntax_check_cache
                                 /.chef/backup
                                 /.chef/test ]

default['user']['authorized_keys'] = "/root/.ssh/authorized_keys"

#default['user']['pem'] = %w[ /.chef/solo.pem.pub
#                             /.chef/solo.pem ]

#default['user']['knife'] = "/.chef/knife.rb"
#default['user']['data_bag_secret'] = "/.chef/encrypted_data_bag_secret"

