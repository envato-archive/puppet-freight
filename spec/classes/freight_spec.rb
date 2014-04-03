require 'spec_helper'

describe 'freight' do
  let(:title) { 'freight' }

  describe "freight class with default parameters" do
    let(:params) {{ :gpgkey => "nobody@example.com" }}
    let(:facts) {{
      :lsbdistid => "Debian",
      :lsbdistcodename => "precise"
    }}

    it { should create_class('freight') }
    it { should create_package('freight') }
    it { should create_file('/etc/freight.conf') }
    it {
      should create_file('/etc/freight.conf')\
      .with_content(/^GPG="nobody@example.com"$/)
    }
  end
end

