require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'minitest/autorun'
require 'shoulda-context'
require 'rack/test'
require 'mocha/setup'

ENV['RACK_ENV'] = 'test'

require 'sidekiq-cron'
