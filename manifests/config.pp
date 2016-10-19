#
class memcached::config {

  $cache_size      = $::memcached::cache_size
  $max_connections = $::memcached::max_connections
  $port            = $::memcached::port
  $user            = $::memcached::user

  case $::osfamily {
    'RedHat': {
      file { '/etc/sysconfig/memcached':
        ensure  => file,
        owner   => 0,
        group   => 0,
        mode    => '0644',
        content => template("${module_name}/sysconfig.erb"),
      }
    }
    default: {}
  }
}
