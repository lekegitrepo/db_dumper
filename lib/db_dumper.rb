# frozen_string_literal: true
#! /usr/bin/env ruby

require_relative "db_dumper/version"

module DbDumper
  class Error < StandardError; end

  database = ARGV.shift
  username = ARGV.shift
  password = ARGV.shift

  database_cmd = ARGV.shift

  end_of_itr = ARGV.shift

  if end_of_itr.nil?
    backup_file = database + Time.now.strftime('%Y%m%d')
  else
    backup_file = database + end_of_itr
  end

  dump_cmd = "#{database_cmd} -u#{:username} -p#{password}" + "#{database}"

  `#{dump_cmd} > #{backup_file}.sql`
  `gzip #{backup_file}.sql`
end
