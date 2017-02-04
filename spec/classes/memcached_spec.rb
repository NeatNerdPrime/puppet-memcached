require 'spec_helper'

describe 'memcached' do

  context 'on unsupported distributions' do
    let(:facts) do
      {
        :osfamily => 'Unsupported'
      }
    end

    it { expect { should compile }.to raise_error(/not supported on an Unsupported/) }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}", :compile do
      let(:facts) do
        facts
      end

      it { should contain_class('memcached') }
      it { should contain_class('memcached::config') }
      it { should contain_class('memcached::install') }
      it { should contain_class('memcached::params') }
      it { should contain_class('memcached::service') }
      it { should contain_package('memcached') }
      it { should contain_service('memcached') }

      case facts[:osfamily]
      when 'RedHat'
        it { should contain_file('/etc/sysconfig/memcached') }
      when 'Debian'
        it { should contain_file('/etc/default/memcached') }
        it { should contain_file('/etc/memcached.conf') }
      end
    end
  end
end
