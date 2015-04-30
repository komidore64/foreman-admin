# -*- encoding: utf-8 -*-

module ForemanAdmin
  class ExternalCommand < ForemanAdmin::Command
    # The base command that will be executed externally.
    # Think of this as ARGV[0] of what we're running externally.
    def self.external_invocation(invocation = nil)
      @external_invocation = invocation if invocation
      @external_invocation
    end

    def external_invocation
      self.class.external_invocation
    end

    # The exact assembled command that will be executed externally.
    # Override this in a child class if you want it have logic.
    def external_command
      "#{external_invocation}"
    end

    def execute
      puts `#{external_command}`
    end
  end
end
