module ForemanAdmin
  class ExternalCommandTest < MiniTest::Unit::TestCase
    include ForemanAdminTestHelpers

    def setup
      @command = ExternalCommand.new('')
    end

    def teardown
      @command = nil
      ExternalCommand.external_invocation(nil)
    end

    def test_external_invocation
      ExternalCommand.external_invocation('figlet')

      assert_equal(@command.external_invocation, 'figlet')
    end

    def test_external_command
      ExternalCommand.external_invocation('figlet')

      assert_equal(@command.external_command, 'figlet')
    end
  end
end
