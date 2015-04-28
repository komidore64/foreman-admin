# -*- encoding: utf-8 -*-

module ForemanAdmin
  class TaskExportCommand < ForemanAdmin::Command
    command_name 'export-tasks'
    description "Export a file containing Foreman's task data"
  end
end
