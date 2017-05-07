#!/usr/bin/env bash

test -n "$DEBUG" && set -x

#                      __ __       ___
#                     /\ \\ \    /'___`\
#                     \ \ \\ \  /\_\ /\ \
#                      \ \ \\ \_\/_/// /__
#                       \ \__ ,__\ // /_\ \
#                        \/_/\_\_//\______/
#                           \/_/  \/_____/
#                                         Algoritimos
#
#
#      Author: Ivan Lopes
#        Mail: ivan (at) 42algoritmos (dot) com (dot) br
#        Site: http://www.42algoritmos.com.br
#     License: gpl
#       Phone: +1 561 801 7985
#    Language: Shell Script
#        File: roles.sh
#        Date: Qua 29 Mar 2017 10:36:05 BRT
# Description:
# ----------------------------------------------------------------------------
# Modo strict
set -euo pipefail
# ----------------------------------------------------------------------------

##############################################################################
##############################################################################
##############################################################################

    NOK='\e[48;5;16m ✖ \t\e[0m'
     OK='\e[1;49;92m[✓]\t\e[0m'
CREATED='\e[1;49;33mCreated:\e[0m'
    NOT='\e[1;49;36mNOT\e[0m'
# ----------------------------------------------------------------------------
# Run!

if ! test $# -eq 3; then
  exit 1
fi

mkjson() {

  KEY_PATH=$1
      USER=$2
  JSONFILE=$3
  ssh_rsa=$( cut -d' ' -f1-2 ${KEY_PATH}/id_rsa_${USER}.pub )

  cat <<EOF > $JSONFILE
{
  "name": "superuser",
  "default_attributes": {
    "user":{
      "name": "${USER}",
      "ssh_key": "${ssh_rsa}",
      "authorized_keys": "/${USER}/.ssh/authorized_keys"
    },
    "openssh": {
      "server": {
        "port": 22,
        "protocol": 2,
        "use_privilege_separation": "yes",
        "ignore_rhosts": "yes",
        "permit_root_login": "yes",
        "password_authentication": "no",
        "permit_empty_passwords": "no"
      }
    }
  },
  "override_attributes": {},
  "json_class": "Chef::Role",
  "description": "The base role for root user with ssh",

  "chef_type": "role",

  "run_list": [
    "recipe[root::default]",
    "recipe[openssh]"
  ]
}
EOF
}

mkjson $@

# ----------------------------------------------------------------------------
exit 0
