#
class memcached::params {

  case $::osfamily {
    'RedHat': {
      $cache_size          = 64
      $max_connections     = 1024
      $package_name        = 'memcached'
      $port                = 11211
      $python_package_name = 'python-memcached'
      $service_name        = 'memcached'
      $user                = 'memcached'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
