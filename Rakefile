# -*- encoding:utf-8 -*-

require 'rake/testtask'
require 'bundler/gem_tasks'

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  desc 'Run RuboCop style checker with xml output for Jenkins'
  task 'rubocop:jenkins' do
    system('bundle exec rubocop \
           --require rubocop/formatter/checkstyle_formatter \
           --format Rubocop::Formatter::CheckstyleFormatter \
           --no-color --out rubocop.xml')
  end
rescue LoadError
  puts 'Rubocop not loaded.'
  task :rubocop do
    # do nothing
  end
end

begin # TODO: remove begin-block once all i18n stuff is in place

  namespace :gettext do
    desc 'update pot file'
    task :find do
      require 'foreman-admin/version'
      require 'foreman-admin/i18n'
      require 'gettext/tools'

      domain = ForemanAdmin::I18n::LocalDomain.new
      GetText.update_potfiles(domain.domain_name,
        domain.translated_files,
        "#{domain.domain_name} #{ForemanAdmin.version}",
        :po_root => domain.locale_dir)
    end
  end
rescue => e
  puts 'Error occuring during localization task'
  puts e.message
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = ['test/helper.rb']
end

task :default => [:test, :rubocop]
