ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'

require File.expand_path(File.dirname(__FILE__) + "/../app/sinatraApp")

RSpec.configure do |config|
  config.failure_color = :red
  config.tty = true
  config.color = true
  config.order = 'random'
  config.include Rack::Test::Methods
end

def app
  SinatraApp
end