require 'sinatra'


get '/home' do
  erb :index
end

get '/owners/find' do
  erb :'owners/find'
end

get '/vets' do
  erb :'/vets/index'
end