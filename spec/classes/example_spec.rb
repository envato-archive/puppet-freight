require 'spec_helper'

describe 'freight' do
  let(:title) { 'freight' }

  ['Debian', 'RedHat'].each do |osfamily|
    describe "freight class without any parameters on #{osfamily}" do 
      let(:params) {{ }}
      let(:facts) { { :osfamily => osfamily } }

      it { should create_class('freight') }
      it { should create_package('freight') }
      it { should create_file('/etc/freight.conf') }
      it {
        should create_file('/etc/freight.conf')\
        .with_content(/^server pool.freight.org$/)
      }
      if osfamily == 'RedHat' 
        it { should create_service('freightd') }
      else
        it { should create_service('freight') }
      end
    end
  end
end
