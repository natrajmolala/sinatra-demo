require_relative '../veterinarian/vet'
require_relative '../../app/veterinarian/vet_service'

class SinatraApp < Sinatra::Base

  before '*' do
    @active_menu = 'admin'
  end

  get '/admin/:page' do

    result = {}
    if params[:page] == 'vets'
      result = PetClinic::VetService.all_vets
    end

    erb :"admin/#{params[:page]}/index", :locals => {result: result}
  end

  get '/admin/:page/new' do
    erb :"admin/#{params[:page]}/new"
  end

  post '/admin/:page/create' do

    if params[:page] == 'vets'
      vet = Vet.new(first_name: params[:first_name],
                    last_name: params[:last_name],
                    speciality: params[:speciality])
      PetClinic::VetService.add_vet vet
    end

    redirect to("admin/#{params[:page]}")
  end

  get '/admin/:page/remove/:db_id' do

    if params[:page] == 'vets'
      PetClinic::VetService.remove_vet (params[:db_id])
    end

    redirect to("admin/#{params[:page]}")
  end

end