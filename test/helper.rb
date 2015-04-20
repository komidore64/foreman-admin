require 'minitest/autorun'
require 'pry-rescue/minitest' rescue LoadError

require 'foreman_admin'

def capture_stdout(&block)
  old_stdout = $stdout
  $stdout = StringIO.new('', 'w')
  block.call
  $stdout.string.gsub(/\r/, '')
ensure
  $stdout = old_stdout
end

Dir['./test/**/*_test.rb'].each do |f|
  require f
end
