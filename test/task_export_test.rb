module ForemanAdmin
  class TaskExportCommandTest < MiniTest::Unit::TestCase
    def setup
      @command = TaskExportCommand.new('')
    end

    def teardown
      @command = nil
    end
  end
end
