module ForemanAdmin
  class BackupCommandTest < MiniTest::Unit::TestCase
    include ForemanAdminTestHelpers

    def setup
      @command = BackupCommand.new('')
    end

    def teardown
      @command = nil
    end

    def test_external_command
      assert_equal(@command.external_command, '/usr/sbin/foreman-backup')
    end
  end
end
