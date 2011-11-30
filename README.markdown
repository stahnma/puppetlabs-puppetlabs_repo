# Overview


# Quick Start

    node default {
      include puppetlabs_repo
    }

# Tips

The yum.puppetlabs.com repository may be easily cloned.

    rsync -avxHP --delete rsync://yum.puppetlabs.com /path/to/your/mirror

If you're running your own mirror, just update $baseurl when calling the puppetlabs_repo::yum class.

# Notes
The yum repository from Puppet Labs shouldn't require any dependencies outside of the base os/updates repos. If it does, that is a bug that will be addressed.  

Bugs for yum.puppetlabs.com can be filed at: http://projects.puppetlabs.com/projects/puppet-community-pkg-repo/issues


