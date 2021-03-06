require_relative '../pet/pet'
require_relative '../owner/contact_details'
require_relative '../owner/owner'
require_relative '../veterinarian/vet'
require_relative '../veterinarian/vet_service'

class SinatraApp < Sinatra::Base

  get '/home' do
    @active_menu = 'home'
    erb :index
  end

  get '/owners' do
    @active_menu = 'owners'
    erb :'owners/index'
  end

  post '/owners/find' do
    @active_menu = 'owners'
    erb :'owners/owners', locals: {search_term: params[:name]}
  end

  get '/vets' do
    @active_menu = 'vets'
    erb :'/vets/index', locals: {vets: PetClinic::VetService.all_vets}
  end

  get '/about' do
    @active_menu = 'about'
    erb :about
  end
end