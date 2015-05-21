module ForemanAdminTestHelpers
  def assert_includes_option(command, expected_option, msg = nil)
    assert_includes(command.external_command.gsub(command.external_invocation, '').strip, expected_option, msg)
  end

  def refute_includes_option(command, refuted_option, msg = nil)
    refute_includes(command.external_command.gsub(command.external_invocation, '').strip, refuted_option, msg)
  end
end

require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end

require 'minitest/autorun'
require 'foreman_admin'

begin
  require 'pry-rescue/minitest'
rescue LoadError
  puts 'pry-rescue not found. skipping...'
end

Dir['./test/**/*_test.rb'].each do |f|
  require f
end
