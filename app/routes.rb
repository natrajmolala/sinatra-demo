class SinatraApp < Sinatra::Base

  get '/home' do
    erb :index
  end

  get '/owners' do
    erb :'owners/index'
  end

  post '/owners/find' do
    puts params[:name]
    erb :'owners/owners', :locals => {:search_term => params[:name]}
  end

  get '/vets' do
    erb :'/vets/index'
  end

  get '/about' do
    erb :about
  end




end
