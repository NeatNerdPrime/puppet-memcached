require 'spec_helper_acceptance'

describe 'memcached::python' do

  it 'should work with no errors' do

    pp = <<-EOS
      include ::memcached::python
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe package('python-memcached') do
    it { should be_installed }
  end
end
