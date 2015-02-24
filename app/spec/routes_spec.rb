require 'rspec'
require 'rack/test'

require_relative '../routes'
require_relative 'spec_helper'

set :environment, :test

def app
  Sinatra::Application
end

describe 'Check routes' do
  include Rack::Test::Methods

  it 'should load home page' do
    get '/home'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('Welcome to Pet clinic')
  end

  it 'should find owners page' do
    get '/owners/find'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('Find owners')
  end

  it 'should load home page' do
    get '/vets'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('Vets home')
  end

end