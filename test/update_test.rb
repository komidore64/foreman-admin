module ForemanAdmin
  class UpdateCommandTest < MiniTest::Unit::TestCase
    def setup
      @command = UpdateCommand.new('')
    end

    def teardown
      @command = nil
    end
  end
end
