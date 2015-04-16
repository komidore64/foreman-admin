# -*- encoding: utf-8 -*-

$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'foreman_admin/version'

Gem::Specification.new do |spec|
  spec.authors = ['Adam Price']

  spec.email = ['komidore64@gmail.com']
  spec.license = 'GPL-3'
  spec.description = <<-EOD
    Foreman-admin is a command line tool for
    carrying out a few administrative actions
    on a Foreman server.'
  EOD
  spec.summary = 'Foreman administrative actions'
  spec.homepage = 'https://github.com/theforeman/foreman-admin'

  spec.files = Dir['{bin,lib}/**/*',
                   'locale/**/*',
                   'Gemfile',
                   'LICENSE',
                   'Rakefile',
                   'README.md']
  # TODO: spec.test_files = stuff

  spec.name = 'foreman_admin'
  spec.require_paths = ['lib']
  spec.version = ForemanAdmin.version

  spec.add_dependency 'clamp'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-checkstyle_formatter'
  spec.add_development_dependency 'gettext', '~> 2.0'
end
