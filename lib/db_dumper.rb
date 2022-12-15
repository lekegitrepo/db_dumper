# frozen_string_literal: true

# ! /usr/bin/env ruby

require_relative 'db_dumper/version'

module DbDumper
  class Error < StandardError; end

  database = ARGV.shift
  username = ARGV.shift
  password = ARGV.shift

  database_cmd = ARGV.shift

  end_of_itr = ARGV.shift

  backup_file = if end_of_itr.nil?
                  database + Time.now.strftime('%Y%m%d')
                else
                  database + end_of_itr
                end

  dump_cmd = "#{database_cmd} -uusername -p#{password}" + database.to_s

  `#{dump_cmd} > #{backup_file}.sql`
  `gzip #{backup_file}.sql`
end
