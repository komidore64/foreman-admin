module ForemanAdmin
  class RestoreCommandTest < MiniTest::Unit::TestCase
    def setup
      @command = RestoreCommand.new('')
    end

    def teardown
      @command = nil
    end
  end
end
