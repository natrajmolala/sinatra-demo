require_relative '../../veterinarian/vet'
require_relative '../../../app/veterinarian/vet_service'

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
    erb :'/vets/index', :locals => {:vets => PetClinic::VetService.all_vets}
  end

  get '/about' do
    erb :about
  end
end