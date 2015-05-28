module ForemanAdmin
  class RestoreCommandTest < MiniTest::Unit::TestCase
    include ForemanAdminTestHelpers

    def setup
      @command = RestoreCommand.new('')
    end

    def teardown
      @command = nil
    end
  end
end
