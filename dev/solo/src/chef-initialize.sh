#!/usr/bin/env bash

(
  cd /root/.chef;
  curl -o knife_admin_key.tar.gz  -Ok https://chef:443/knife_admin_key.tar.gz;
  tar xvzf knife_admin_key.tar.gz
  mv chef-validator.pem /etc/chef
)

knife client list

#chefConf=/etc/chef/solo.rb
#chef-solo -c $chefConf

exit 0
