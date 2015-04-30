# -*- encoding: utf-8 -*-

module ForemanAdmin
  class RestoreCommand < ForemanAdmin::ExternalCommand
    command_name 'restore'
    description 'Restore your Foreman server'
    external_invocation '/usr/sbin/foreman-restore'

    # TODO: any options?
    #
    # or parameters?
  end
end
