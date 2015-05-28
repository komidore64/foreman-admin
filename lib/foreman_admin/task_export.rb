# -*- encoding: utf-8 -*-

module ForemanAdmin
  class TaskExportCommand < ForemanAdmin::ExternalCommand
    command_name 'export-tasks'
    description "Export a file containing Foreman's task data (default: only incomplete tasks are exported)"
    external_invocation '/usr/sbin/foreman-rake foreman_tasks:export_tasks'

    option ['--all'], :flag, 'Export all tasks (Note: this could take some time)'
    option ['--export-file'], 'FILENAME', 'Specify the filename.tar.gz archive to export tasks into'

    def external_command
      args = []
      args << 'tasks=all' if all?
      args << "export=#{export_file}" if export_file

      args.unshift(external_invocation)
      args.join(' ')
    end
  end
end
