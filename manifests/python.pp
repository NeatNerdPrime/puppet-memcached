# Install Python Memcache bindings.
#
# @example Declaring the class
#   include ::memcached::python
#
# @param package_name The name of the package.
#
# @see puppet_classes::memcached ::memcached
class memcached::python (
  String $package_name = $::memcached::params::python_package_name,
) inherits ::memcached::params {

  package { $package_name:
    ensure => present,
  }
}
