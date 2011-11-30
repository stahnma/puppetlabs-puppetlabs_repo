# Fact: repo_osfamily
#
# Purpose: Returns the operating system family 
#
# Resolution:
#   Maps operating systems to operating system families, such as linux
#   distribution derivatives. Adds mappings from specific operating systems
#   to kernels in the case that it is relevant.
#
# Caveats:
#   This is a stopgap since the $osfamily fact was not added to facter until 1.6.2.  
#   This is for backward compatibility with older version of facter.
#
Facter.add(:repo_osfamily) do
  setcode do
    case Facter.value(:operatingsystem)
    when "RedHat", "Fedora", "CentOS", "Scientific", "SLC", "Ascendos", "CloudLinux", "PSBM", "OracleLinux", "OVS", "OEL"
      "RedHat"
    when "Ubuntu", "Debian"
      "Debian"
    when "SLES", "SLED", "OpenSuSE", "SuSE"
      "Suse"
    when "Solaris"
      "Solaris"
    else
      Facter.value("kernel")
    end 
  end 
end
