# -*- encoding: utf-8 -*-

module ForemanAdmin
  class NotImplementedError < RuntimeError; end

  class Command < ::Clamp::Command
    def self.command_name(name = nil)
      @command_name = name if name
      @command_name
    end

    def command_name
      self.class.command_name
    end

    def self.description(description = nil)
      @description = description if description
      @description
    end

    def description
      self.class.description
    end

    def execute
      fail NotImplementedError, "#{self.class.name} has not yet been implemented"
    end
  end

  class ExternalCommand < ForemanAdmin::Command
    def self.external_invocation(invocation = nil)
      @external_invocation = invocation if invocation
      @external_invocation
    end

    def external_invocation
      self.class.external_invocation
    end

    def external_command
      "#{external_invocation}"
    end

    def execute
      puts `#{external_command}`
    end
  end
end
