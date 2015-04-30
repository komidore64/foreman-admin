# -*- encoding: utf-8 -*-

module ForemanAdmin
  class TaskExportCommand < ForemanAdmin::ExternalCommand
    command_name 'export-tasks'
    description "Export a file containing Foreman's task data"
    external_invocation '/usr/sbin/foreman-rake task-export'

    # TODO: any options?
    #
    # or parameters?
  end
end
