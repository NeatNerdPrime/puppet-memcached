require 'spec_helper_acceptance'

describe 'memcached' do

  it 'should work with no errors' do

    pp = <<-EOS
      include ::memcached
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe package('memcached') do
    it { should be_installed }
  end

  describe file('/etc/sysconfig/memcached') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe service('memcached') do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('memcached-tool 127.0.0.1:11211 stats') do
    its(:exit_status) { should eq 0 }
  end
end
