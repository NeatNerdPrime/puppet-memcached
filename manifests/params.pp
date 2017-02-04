# @!visibility private
class memcached::params {

  $package_name = 'memcached'
  $service_name = 'memcached'

  case $::osfamily {
    'RedHat': {
      $cache_size          = 64
      $interface           = undef
      $max_connections     = 1024
      $port                = 11211
      $python_package_name = 'python-memcached'
      $user                = 'memcached'
    }
    'Debian': {
      $cache_size          = 64
      $interface           = ['127.0.0.1']
      $max_connections     = undef
      $port                = 11211
      $python_package_name = 'python-memcache'

      case $::operatingsystem {
        'Ubuntu': {
          $user = 'memcache'
        }
        default: {
          $user = 'nobody'
        }
      }
    }
    'OpenBSD': {
      $cache_size          = undef
      $interface           = undef
      $max_connections     = undef
      $port                = undef
      $python_package_name = 'py-memcached'
      $user                = '_memcached'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
