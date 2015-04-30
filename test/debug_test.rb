module ForemanAdmin
  class DebugCommandTest < MiniTest::Unit::TestCase
    include ForemanAdminTestHelpers

    FAKE_FOREMAN_DEBUG = File.join(File.expand_path(File.dirname(__FILE__)), 'fake-scripts', 'fake-foreman-debug')

    NO_UPLOAD_OUTPUT = <<"EOF"
line 1
line 2
line 3
Do you want to do this now? [y/N]
n
#{DebugCommand::NO_UPLOAD_RESPONSE}
EOF

    UPLOAD_OUTPUT = <<"EOF"
line 1
line 2
line 3
Do you want to do this now? [y/N]
y
#{DebugCommand::UPLOAD_RESPONSE}
EOF

    def setup
      @command = DebugCommand.new('')
      DebugCommand.external_invocation(FAKE_FOREMAN_DEBUG)
    end

    def teardown
      @command = nil
      DebugCommand.external_invocation('/usr/sbin/foreman-debug')
    end

    def test_option_directory
      @command.directory = '/tmp/solid_snake'

      assert_includes_option(@command, "-d '/tmp/solid_snake'")
    end

    def test_option_skip_generic
      @command.generic = false

      assert_includes_option(@command, '-g')
    end

    def test_option_no_tarball
      @command.tarball = false

      assert_includes_option(@command, '-a')
    end

    def test_option_tarball
      @command.tarball = true

      refute_includes_option(@command, '-a')
    end

    def test_option_max_lines
      @command.max_lines = 9001

      assert_includes_option(@command, '-m 9001')
    end

    def test_option_filter_program
      @command.filter_program = '/usr/bin/super-awesome-filter-program'

      assert_includes_option(@command, "-j '/usr/bin/super-awesome-filter-program'")
    end

    def test_option_passwd_patterns
      @command.password_patterns = true

      assert_includes_option(@command, '-p')
    end

    def test_option_quiet
      @command.quiet = true

      assert_includes_option(@command, '-q')
    end

    def test_option_verbose
      @command.verbose = true

      assert_includes_option(@command, '-v')
    end

    def test_pty_spawn_no_upload
      out = capture_stdout do
        @command.execute
      end

      assert_equal(NO_UPLOAD_OUTPUT, out)
    end

    def test_pty_spawn_upload
      @command.upload = true
      out = capture_stdout do
        @command.execute
      end

      assert_equal(UPLOAD_OUTPUT, out)
    end
  end
end
