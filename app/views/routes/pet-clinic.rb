require_relative '../../veterinarian/vet'

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
    vets = []
    vets_array = $mongo_db['veterinarian'].find().to_a
    vets_array.each do |vet_db|
      vets << Vet.new(vet_db['firstname'], vet_db['lastname'], vet_db['speciality'])
    end
    erb :'/vets/index', :locals => {:vets => vets}
  end

  get '/about' do
    erb :about
  end
end