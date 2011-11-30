# Class: puppetlabs_repo
#
# This module manages client for the Puppetlabs yum repository
#
# Parameters:
#  baseurl, the URI (including trailing slash)
#
# Actions:
#  writes files to /etc/yum.repos.d
#
# Requires:
#  none
#
# Sample Usage:
#
#  node default {
#    include puppetlabs_repo
#  }
#
# Or, for a dirty hack on the shell:
#
#   puppet apply -e "include puppetlabs_repo::yum"
#
class puppetlabs_repo {

   if $has_yum == "true" { 
     include puppetlabs_repo::yum
   }

}
