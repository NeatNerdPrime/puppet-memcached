# Joins interfaces and ports together wrapping IPv6 addresses as appropriate.
#
# @example Sample usage
#   # '[::1],127.0.0.1:11211'
#   memcached::join_interfaces(['::1', ['127.0.0.1', 11211]])
#
# @param interfaces Array of interfaces.
#
# @return [String] Interfaces joined together.
#
# @since 2.0.0
function memcached::join_interfaces(Array[Memcached::Interface] $interfaces) {

  join($interfaces.map |Memcached::Interface $interface| {
    type($interface) ? {
      Type[Tuple] => join([bodgitlib::enclose_ipv6($interface[0]), $interface[1]], ':'),
      default     => bodgitlib::enclose_ipv6($interface),
    }
  }, ',')
}
