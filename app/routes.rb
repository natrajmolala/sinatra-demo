require_relative 'veterinarian/vet'

class SinatraApp < Sinatra::Base

  get '/home' do
    erb :index
  end

  get '/owners' do
    erb :'owners/index'
  end

  post '/owners/find' do
    erb :'owners/owners', :locals => {:search_term => params[:name]}
  end

  get '/vets' do
    vets = [Vet.new('John Rambo', 'Radiology'), Vet.new('Henry Lamb', 'Dentistry')]
    erb :'/vets/index', :locals => {:vets => vets}
  end

  get '/about' do
    erb :about
  end




end
