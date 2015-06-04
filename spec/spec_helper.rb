ENV["RACK_ENV"] ||= "test"

require 'rack/test'
require 'bundler/setup'
require 'vcr'
require 'webmock'
require 'bundler/setup'
require File.expand_path '../../app.rb', __FILE__

Bundler.require
Bundler.setup(:default, :test)

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
end

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
   config.color     = true
   config.tty       = true
   config.formatter = :documentation # :progress, :html, :textmate
   config.include Rack::Test::Methods
   config.include RSpecMixin

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
