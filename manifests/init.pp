# == Class: ovirt
#
# This class contains the common requirements of ovirt::engine and ovirt::node.
#
# === Parameters
#
# [*ovirt_release_base_url*]
#   This setting can be used to override the default url of http://ovirt.org/releases.
#
# === Authors
#
# Jason Cannon <jason@thisidig.com>
# Joris Dedieu <joris.dedieu@nfrance.com>

class ovirt(
  $ovirt_release_base_url = 'http://resources.ovirt.org/pub/yum-repo',
  $ovirt_release_version  = '41',
) {
  case $::osfamily {
    RedHat: {
      package { $ovirt_release:
        ensure   => installed,
        provider => 'rpm',
        source   => "${ovirt_release_url}/ovirt-release41.rpm",
      }
    }
    default: {
      fail("The ${::operatingsystem} operating system is not supported.")
    }
  }
}
