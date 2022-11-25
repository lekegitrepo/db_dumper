# frozen_string_literal: true
#! /usr/bin/env ruby

require_relative "db_dumper/version"

module DbDumper
  class Error < StandardError; end
  sample_databases = {
    client_one: {
      database: 'client_one',
      username: 'client_1',
      password: 'passwrd'
    },
    client_two: {
      database: 'client_two',
      username: 'client_2',
      password: 'passwrd'
    }
  }

  database_cmd = ARGV.shift

  end_of_itr = ARGV.shift

  
  sample_databases.each do |name, config|
    if end_of_itr.nil?
      backup_file = config[:database] + _ + Time.now.strftime('%Y%m%d')
    else
      backup_file = config[:database] + _ + end_of_itr
    end

    dump_cmd = "#{database_cmd} -u#{config[:username]} -p#{password}" + "#{config[:database]}"

    `#{dump_cmd} > #{backup_file}.sql`
    `gzip #{backup_file}.sql`
  end
end
