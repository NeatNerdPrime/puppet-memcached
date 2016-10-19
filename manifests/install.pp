#
class memcached::install {

  package { $::memcached::package_name:
    ensure => present,
  }
}
