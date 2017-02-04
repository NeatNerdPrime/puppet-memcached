# @!visibility private
class memcached::service {

  case $::osfamily {
    'OpenBSD': {
      $interface = $::memcached::interface ? {
        undef   => undef,
        default => memcached::join_interface($::memcached::interface),
      }

      # lint:ignore:undef_in_function
      $flags = join(delete_undef_values([
        "-u ${::memcached::user}",
        $::memcached::cache_size ? {
          undef   => undef,
          default => "-m ${::memcached::cache_size}",
        },
        $::memcached::max_connections ? {
          undef   => undef,
          default => "-c ${::memcached::max_connections}",
        },
        $::memcached::port ? {
          undef   => undef,
          default => "-p ${::memcached::port}",
        },
        $interface ? {
          undef   => undef,
          default => "-l ${interface}",
        },
        $::memcached::sasl ? {
          true  => '-S',
          false => undef,
        },
      ]), ' ')
      # lint:endignore
    }
    default: {
      $flags = undef
    }
  }

  service { $::memcached::service_name:
    ensure     => running,
    enable     => true,
    flags      => $flags,
    hasstatus  => true,
    hasrestart => true,
  }
}
