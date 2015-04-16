# -*- encoding: utf-8 -*-

module ForemanAdmin
  class Command < ::Clamp::Command
    attr_accessor :command_name, :description

    def self.command_name(name = nil)
      @command_name = name if name
      @command_name
    end

    def self.description(description = nil)
      @description = description if description
      @description
    end

    def execute
      puts "#{self.class.name} has not yet been implemented"
    end
  end
end
