require 'spec_helper'

describe 'freight::config' do
  let(:title) { 'freight::config' }

  describe "freight config class without default parameters" do 
    let(:params) {{ :gpgkey => "nobody@example.com" }}

    it { should create_file('/etc/freight.conf') }
    it {
      should create_file('/etc/freight.conf')\
      .with_content(/^VARLIB="\/var\/lib\/freight"$/)
      .with_content(/^VARCACHE="\/var\/cache\/freight"$/)
      .with_content(/^ORIGIN="Freight"$/)
      .with_content(/^LABEL="Freight"$/)
      .with_content(/^CACHE="on"$/)
      .with_content(/^GPG="nobody@example.com"$/)
    }
  end

  describe "freight config with caching disabled" do
    let(:params) {{ :gpgkey => "nobody@example.com",
                    :cache  => false }}

    it {
      should create_file('/etc/freight.conf')\
      .with_content(/^CACHE="off"$/)
    }
  end
end


