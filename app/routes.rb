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

  get '/admin' do
    erb :'admin/index'
  end

  get '/admin/:page' do

    result = {}
    if params[:page] == 'vets'
      vets_array = $mongo_db['veterinarian'].find().to_a
      vets_array.each do |vet_db|
        result[vet_db['_id']] = Vet.new(vet_db['firstname'], vet_db['lastname'], vet_db['speciality'])
      end
    end

    erb :"admin/#{params[:page]}/index", :locals => {:result => result}
  end

  get '/admin/:page/new' do
    erb :"admin/#{params[:page]}/new"
  end

  post '/admin/:page/create' do

    if params[:page] == 'vets'
      vet = Vet.new(params[:firstname], params[:lastname], params[:speciality])
      $mongo_db['veterinarian'].insert(vet.to_json)
    end

    redirect to("admin/#{params[:page]}")
  end

  get '/admin/:page/remove/:db_id' do

    if params[:page] == 'vets'
      vet_to_remove = $mongo_db['veterinarian'].find_one(:_id => BSON::ObjectId(params[:db_id]))
      $mongo_db['veterinarian'].remove(vet_to_remove)
    end

    redirect to("admin/#{params[:page]}")
  end

end
