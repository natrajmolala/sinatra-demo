require 'sinatra'

class HelloWorldApp < Sinatra::Base
  get '/hello' do
    "Hello, world!"
  end
end