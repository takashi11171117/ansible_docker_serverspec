require 'spec_helper'

describe command('date') do
  its(:stdout) { should match /JST/ }
end

describe command('strings /etc/localtime') do
  its(:stdout) { should match /JST-9/ }
end
