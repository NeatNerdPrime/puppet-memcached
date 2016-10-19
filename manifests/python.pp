#
class memcached::python (
  $package_name = $::memcached::params::python_package_name,
) inherits ::memcached::params {

  validate_string($package_name)

  package { $package_name:
    ensure => present,
  }
}
