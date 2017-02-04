require 'spec_helper_acceptance'

describe 'memcached::python' do

  case fact('osfamily')
  when 'Debian'
    package = 'python-memcache'
  when 'OpenBSD'
    package = 'py-memcached'
  when 'RedHat'
    package = 'python-memcached'
  end

  it 'should work with no errors' do

    pp = <<-EOS
      Package {
        source => $::osfamily ? {
          # $::architecture fact has gone missing on facter 3.x package currently installed
          'OpenBSD' => "http://ftp.openbsd.org/pub/OpenBSD/${::operatingsystemrelease}/packages/amd64/",
          default   => undef,
        },
      }

      include ::memcached::python
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe package(package) do
    it { should be_installed }
  end
end
