require 'spec_helper'

describe file("/etc/localtime") do
  it { should exist }
end

describe file("/etc/sysconfig/clock") do
  its(:content) { should match /ZONE="#{property[:timezone]}"/ }
end

describe command('ruby -v') do
  its(:stdout) { should match /ruby 2\.2\.2.+/ }
end
