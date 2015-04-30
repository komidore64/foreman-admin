# -*- encoding: utf-8 -*-

module ForemanAdmin
  class UpdateCommand < ForemanAdmin::ExternalCommand
    command_name 'update'
    description 'Update your Foreman server'
    external_invocation '/usb/sbin/foreman-update fancy-style'

    # TODO: any options?
    #
    # or parameters?
  end
end
