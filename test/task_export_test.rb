module ForemanAdmin
  class TaskExportCommandTest < MiniTest::Unit::TestCase
    include ForemanAdminTestHelpers

    def setup
      @command = TaskExportCommand.new('')
    end

    def teardown
      @command = nil
    end

    def test_export_all
      @command.all = true

      assert_includes_option(@command, 'tasks=all')
    end

    def test_export_filename
      @command.export_file = '/tmp/liquid_snake.tar.gz'

      assert_includes_option(@command, 'export=/tmp/liquid_snake.tar.gz')
    end
  end
end
