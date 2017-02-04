require 'spec_helper_acceptance'

describe 'memcached' do

  it 'should work with no errors' do

    pp = <<-EOS
      Package {
        source => $::osfamily ? {
          # $::architecture fact has gone missing on facter 3.x package currently installed
          'OpenBSD' => "http://ftp.openbsd.org/pub/OpenBSD/${::operatingsystemrelease}/packages/amd64/",
          default   => undef,
        },
      }

      include ::memcached
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe package('memcached') do
    it { should be_installed }
  end

  describe file('/etc/default/memcached'), :if => fact('osfamily').eql?('Debian') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file('/etc/memcached.conf'), :if => fact('osfamily').eql?('Debian') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file('/etc/sysconfig/memcached'), :if => fact('osfamily').eql?('RedHat') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe service('memcached') do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('memcached-tool 127.0.0.1:11211 stats'), :unless => fact('osfamily').eql?('Debian') do
    its(:exit_status) { should eq 0 }
  end

  describe command('/usr/share/memcached/scripts/memcached-tool 127.0.0.1:11211 stats'), :if => fact('osfamily').eql?('Debian') do
    its(:exit_status) { should eq 0 }
  end
end
