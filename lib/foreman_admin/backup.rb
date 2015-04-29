# -*- encoding: utf-8 -*-

module ForemanAdmin
  class BackupCommand < ForemanAdmin::Command
    command_name 'backup'
    description 'Backup your Foreman server'
    external_invocation '/usr/sbin/foreman-backup'

    # TODO: any options?
    #
    # or parameters?
  end
end
