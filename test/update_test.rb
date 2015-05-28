module ForemanAdmin
  class UpdateCommandTest < MiniTest::Unit::TestCase
    include ForemanAdminTestHelpers

    def setup
      @command = UpdateCommand.new('')
    end

    def teardown
      @command = nil
    end
  end
end
