# Class: puppetlabs_repo::yum
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
#    include puppetlabs_yum_repo
#  }
#
# Or, for a dirty hack on the shell:
#
#   puppet apply -e "include puppetlabs_yum_repo"
#

class puppetlabs_repo::yum($baseurl = 'http://yum.puppetlabs.com/') {

       if $operatingsystem == "Fedora" {
             $ostype="fedora"
             $prefix="f"
       } elsif $repo_osfamily == "RedHat" {
             $ostype="el"
             $prefix=""
       }
       else {
          err("Unable to determine operating system information to assign yum repo.")
       }


    yumrepo { "puppetlabs-deps":
        baseurl  => "${baseurl}${ostype}/${prefix}\$releasever/dependencies/\$basearch",
        descr    => "Puppet Labs Dependencies \$releasever - \$basearch ",
        enabled  => "1",
        gpgcheck => "1",
        gpgkey   => "${baseurl}RPM-GPG-KEY-puppetlabs",
    }

    yumrepo { "puppetlabs-deps-source":
        baseurl  => "${baseurl}${ostype}/${prefix}\$releasever/dependencies/SRPMS",
        descr    => "Puppet Labs Source Dependencies \$releasever - \$basearch - Source",
        enabled  => "0",
        gpgcheck => "1",
        gpgkey   => "${baseurl}RPM-GPG-KEY-puppetlabs",
    }

    yumrepo { "puppetlabs-products":
        baseurl  => "${baseurl}${ostype}/${prefix}\$releasever/products/\$basearch",
        descr    => "Puppet Labs Products \$releasever - \$basearch",
        enabled  => "1",
        gpgcheck => "1",
        gpgkey   => "${baseurl}RPM-GPG-KEY-puppetlabs",
    }

    yumrepo { "puppetlabs-products-source":
        baseurl        => "${baseurl}${ostype}/${prefix}\$releasever/products/SRPMS",
        descr          => "Puppet Labs Products \$releasever - \$basearch - Source",
        enabled        => "0",
        gpgcheck       => "1",
        gpgkey         => "${baseurl}RPM-GPG-KEY-puppetlabs",
    }

}
