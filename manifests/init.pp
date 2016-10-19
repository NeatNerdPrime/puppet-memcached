#
class memcached (
  $cache_size      = $::memcached::params::cache_size,
  $max_connections = $::memcached::params::max_connections,
  $package_name    = $::memcached::params::package_name,
  $port            = $::memcached::params::port,
  $service_name    = $::memcached::params::service_name,
  $user            = $::memcached::params::user,
) inherits ::memcached::params {

  validate_integer($cache_size, '', 0)
  validate_integer($max_connections, '', 0)
  validate_string($package_name)
  validate_integer($port, 65535, 0)
  validate_string($service_name)
  validate_string($user)

  include ::memcached::install
  include ::memcached::config
  include ::memcached::service

  anchor { 'memcached::begin': }
  anchor { 'memcached::end': }

  Anchor['memcached::begin'] -> Class['::memcached::install']
    ~> Class['::memcached::config'] ~> Class['::memcached::service']
    -> Anchor['memcached::end']
}
