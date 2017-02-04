# Installs and manages Memcached.
#
# @example Declaring the class
#   include ::memcached
#
# @example Listen on specific interfaces
#   class { '::memcached':
#     interface => [
#       '127.0.0.1',
#       ['::1', 11212],
#     ],
#   }
#
# @example Enabling SASL on OpenBSD
#   class { '::memcached':
#     package_name => 'memcached-sasl', # Requires SASL-flavoured package
#     sasl         => true,
#   }
#
# @param cache_size Cache size in megabytes.
# @param interface List of interfaces to listen on.
# @param max_connections Maximum number of TCP connections.
# @param package_name The name of the package.
# @param port TCP and UDP port number.
# @param service_name The name of the service.
# @param sasl Whether to enable SASL support.
# @param user The unprivileged user to run as.
#
# @see puppet_classes::memcached::python ::memcached::python
class memcached (
  Optional[Integer[0]]                     $cache_size      = $::memcached::params::cache_size,
  Optional[Array[Memcached::Interface, 1]] $interface       = $::memcached::params::interface,
  Optional[Integer[0]]                     $max_connections = $::memcached::params::max_connections,
  String                                   $package_name    = $::memcached::params::package_name,
  Optional[Bodgitlib::Port]                $port            = $::memcached::params::port,
  String                                   $service_name    = $::memcached::params::service_name,
  Boolean                                  $sasl            = false,
  String                                   $user            = $::memcached::params::user,
) inherits ::memcached::params {

  contain ::memcached::install
  contain ::memcached::config
  contain ::memcached::service

  Class['::memcached::install'] -> Class['::memcached::config']
    ~> Class['::memcached::service']
}
