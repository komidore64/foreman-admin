# -*- encoding: utf-8 -*-

module ForemanAdmin
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
      # override me
    end
  end
end
