require 'minitest/autorun'
begin
  require 'pry-rescue/minitest'
rescue LoadError
  puts 'pry-rescue not found. skipping...'
end

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
