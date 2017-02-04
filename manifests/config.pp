# @!visibility private
class memcached::config {

  $cache_size      = $::memcached::cache_size
  $interface       = $::memcached::interface ? {
    undef   => undef,
    default => memcached::join_interfaces($::memcached::interface),
  }
  $max_connections = $::memcached::max_connections
  $port            = $::memcached::port
  $sasl            = $::memcached::sasl
  $user            = $::memcached::user

  case $::osfamily {
    'RedHat': {
      # lint:ignore:undef_in_function
      $options = join(delete_undef_values([
        $interface ? {
          undef   => undef,
          default => "-l ${interface}",
        },
        $sasl ? {
          true  => '-S',
          false => undef,
        },
      ]), ' ')
      # lint:endignore

      file { '/etc/sysconfig/memcached':
        ensure  => file,
        owner   => 0,
        group   => 0,
        mode    => '0644',
        content => template("${module_name}/sysconfig.erb"),
      }
    }
    'Debian': {
      $content = @(EOS/L)
        # !!! Managed by Puppet !!!
        ENABLE_MEMCACHED=yes
        | EOS

      file { '/etc/default/memcached':
        ensure  => file,
        owner   => 0,
        group   => 0,
        mode    => '0644',
        content => $content,
      }

      file { '/etc/memcached.conf':
        ensure  => file,
        owner   => 0,
        group   => 0,
        mode    => '0644',
        content => template("${module_name}/memcached.conf.erb"),
      }
    }
    default: {
      # noop
    }
  }
}
