module ForemanAdmin
  class MainCommand < ForemanAdmin::Command
    option '--version', :flag, 'Show version' do
      puts "#{invocation_path} #{ForemanAdmin.version.version}"
      exit
    end

    subcommand BackupCommand.command_name,
      BackupCommand.description,
      BackupCommand
    subcommand RestoreCommand.command_name,
      RestoreCommand.description,
      RestoreCommand
    subcommand DebugCommand.command_name,
      DebugCommand.description,
      DebugCommand
    subcommand TaskExportCommand.command_name,
      TaskExportCommand.description,
      TaskExportCommand
    subcommand UpdateCommand.command_name,
      UpdateCommand.description,
      UpdateCommand
  end
end
