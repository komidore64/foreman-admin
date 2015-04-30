module ForemanAdmin
  class CommandTest < MiniTest::Unit::TestCase
    def setup
      @command = Command.new('')
    end

    def teardown
      @command = nil
      Command.command_name(nil)
      Command.description(nil)
    end

    def test_command_name
      Command.command_name('foobar')

      assert_equal(@command.command_name, 'foobar')
    end

    def test_description
      Command.description("this command is called 'foobar'")

      assert_equal(@command.description, "this command is called 'foobar'")
    end
  end
end
