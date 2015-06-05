ENV["RACK_ENV"] ||= "test"

require 'rack/test'
require 'bundler/setup'
require 'vcr'
require 'webmock'
require 'bundler/setup'
require 'simplecov'
require 'rake'
require File.expand_path '../../boot.rb', __FILE__

Bundler.require
Bundler.setup(:default, :test)

ENV['APPID'] = '157'
ENV['FORMAT'] = 'json'
ENV['DEVICE_ID'] = '2b6f0cc904d137be2e1730235f5664094b83'
ENV['LOCALE'] = 'de'
ENV['IP'] = '109.235.143.113'
ENV['OFFER_TYPES'] = '112'
ENV['API_KEY'] = 'b07a12df7d52e6c118e5d47d3f9e60135b109a1f'
ENV['URL'] = 'http://api.sponsorpay.com/feed/v1/offers.json?'


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
