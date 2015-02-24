require 'rspec'
require 'rack/test'

require_relative '../app/routes'

RSpec.configure do |config|
  config.failure_color = :red
  config.tty = true
  config.color = true
  config.order = 'random'
end

def app
  Sinatra::Application
end