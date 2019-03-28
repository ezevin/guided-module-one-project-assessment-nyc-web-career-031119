require 'bundler'
require 'word_wrap/core_ext'
require 'colorize'
require 'colorized_string'
require 'audite'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = 1
