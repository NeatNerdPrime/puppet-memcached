require 'spec_helper'

describe 'memcached::python' do

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

      it { should contain_class('memcached::python') }
      case facts[:osfamily]
      when 'RedHat'
        it { should contain_package('python-memcached') }
      when 'Debian'
        it { should contain_package('python-memcache') }
      when 'OpenBSD'
        it { should contain_package('py-memcached') }
      end
    end
  end
end
