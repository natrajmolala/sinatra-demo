class SinatraApp < Sinatra::Base

  get '/home' do
    erb :index
  end

  get '/owners' do
    erb :'owners/index'
  end

  get '/vets' do
    erb :'/vets/index'
  end

  get '/about' do
    erb :about
  end

end
