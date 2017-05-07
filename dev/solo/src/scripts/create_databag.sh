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
#        File: create_databag.sh
#        Date: Qua 29 Mar 2017 10:11:54 BRT
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

if test $# -eq 0; then
  exit 1
fi

KEY_PATH=$1
data_bag_file=${KEY_PATH}/encrypted_data_bag_secret

if test -f $data_bag_file; then
  echo -ne $NOK $NOT $CREATED
else
  echo openssl rand -base64 512 \> $data_bag_file
  openssl rand -base64 512 > $data_bag_file
  echo -ne $OK $CREATED
fi

echo `tput bold` `tput setb 4` `tput setaf 7` "$data_bag_file" `tput sgr0`

# ----------------------------------------------------------------------------
exit 0
