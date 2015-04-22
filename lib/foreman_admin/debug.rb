# -*- encoding: utf-8 -*-

require 'pty'
require 'expect'

module ForemanAdmin
  class DebugCommand < ForemanAdmin::ExternalCommand
    UPLOAD_RESPONSE = 'Archive has been uploaded'
    NO_UPLOAD_RESPONSE = 'Skipping archive upload'
    FOREMAN_DEBUG_PATH = '/usr/sbin/foreman-debug'

    external_invocation FOREMAN_DEBUG_PATH

    option ['-d', '--directory'],
      'DIR',
      'Directory to place the tarball in (default: /tmp/foreman-XYZ)'
    option ['-g', '--[no-]generic'],
      :flag,
      'Whether or not to include generic info (CPU, memory, firewall, etc) (default: true)',
      :default => true
    option ['-a', '--[no-]tarball'],
      :flag,
      'Whether to generate a tarball from the resulting directory (default: true)',
      :default => true
    option ['-m', '--max-lines'],
      'LINES',
      'Maximum lines to keep for each file (default: 5000)'
    option ['-j', '--filter-program'],
      'PROGRAM',
      'Filter with provided program when creating a tarball'
    option ['-p', '--password-patterns'],
      :flag,
      'Print password patterns being filtered out'
    option ['-q', '--quiet'],
      :flag,
      'Quiet mode'
    option ['-v', '--verbose'],
      :flag,
      'Verbose mode'
    option ['--[no-]upload'],
      :flag,
      'Whether to upload archive to rsync://theforeman.org/debug-incoming (default: false)',
      :default => false

    # rubocop:disable Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
    def external_command
      args = []
      args << '-d' << directory if directory
      args << '-g' unless generic?
      args << '-a' unless tarball?
      args << '-m' << max_lines if max_lines
      args << '-j' << filter_program if filter_program
      args << '-p' if password_patterns?
      args << '-q' if quiet?
      args << '-v' if verbose?

      "#{external_invocation} #{args.join(' ')}"
    end
    # rubocop:enable Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

    def execute
      PTY.spawn(external_command) do |p_out, p_in, pid|
        puts p_out.expect('Do you want to do this now? [y/N]')
        choice = upload? ? 'y' : 'n'
        p_in.puts choice
        puts choice
        Process.wait(pid)
        puts upload? ? UPLOAD_RESPONSE : NO_UPLOAD_RESPONSE
      end
    end
  end
end
