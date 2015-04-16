# -*- encoding: utf-8 -*-

module ForemanAdmin
  def self.version
    @version ||= Gem::Version.new('0.0.1')
  end
end
