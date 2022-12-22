# frozen_string_literal: true

# ! /usr/bin/env ruby

require_relative 'db_dumper/version'
require 'optparse'

module DbDumper
  class Error < StandardError; end

  options = {}

  option_parser = OptionParser.new do |opts|
    opts.on('-i', '--iteration') do
      options[:iteration] = true
    end

    opts.on('-u USER', /^.+\..+$/) do |user|
      options[:user] = user
    end

    opts.on('-p PASSWORD') do |password|
      options[:password] = password
    end
  end

  option_parser.parse!
  puts options.inspect

  # database = ARGV.shift
  # username = ARGV.shift
  # password = ARGV.shift

  # database_cmd = ARGV.shift

  # end_of_itr = ARGV.shift

  # backup_file = if end_of_itr.nil?
  #                 database + Time.now.strftime('%Y%m%d')
  #               else
  #                 database + end_of_itr
  #               end

  # dump_cmd = "#{database_cmd} -uusername -p#{password}" + database.to_s

  # `#{dump_cmd} > #{backup_file}.sql`
  # `gzip #{backup_file}.sql`
end
