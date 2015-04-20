module ForemanAdmin
  class MainCommand < ForemanAdmin::Command
    option '--version', :flag, 'Show version' do
      puts "#{invocation_path} #{ForemanAdmin.version.version}"
      exit
    end

    subcommand 'backup', 'Backup your Foreman server', BackupCommand
    subcommand 'restore', 'Restore your Foreman server', RestoreCommand
    subcommand 'generate-debug', 'Create a foreman-debug tarball for debugging purposes', DebugCommand
    subcommand 'export-tasks', "Export a file containing Foreman's task data", TaskExportCommand
    subcommand 'update', 'Update your Foreman server', UpdateCommand
  end
end
