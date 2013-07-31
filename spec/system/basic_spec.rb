require 'spec_helper_system'

describe 'basic tests' do
  it 'class should work without errors' do
    pp = <<-EOS
      class { 'freight': gpgkey => 'DEADBEEF' }
    EOS

    puppet_apply(pp) do |r|
      r.exit_code.should == 2
    end

    shell 'cat /etc/freight.conf' do |r|
      r.stdout.should =~ /^GPG="DEADBEEF"$/
    end

    shell 'sudo freight cache' do |r|
      r.exit_code.should be_zero
    end
  end
end
