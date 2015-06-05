require 'sinatra'
require 'require_all'
require 'httparty'
require 'digest/sha1'
require 'json'
require File.expand_path '../app.rb', __FILE__

require_all 'helpers/*.rb'
