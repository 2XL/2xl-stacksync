# Class: vsftpd::params
#
class stacksync::params {

  $package_name = 'stacksync'
  $service_name = 'stacksync'

  case $::operatingsystem {
    'RedHat',
    'CentOS',
    'Amazon': {
      $confdir = '/etc/stacksync'
    }
    'Debian',
    'Ubuntu': {
      $confdir = '/etc'
    }
    default: {
      $confdir = '/etc/stacksync'
    }
  }

}