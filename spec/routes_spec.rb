describe 'Check routes' do

  it 'should load home page' do
    get '/home'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('Welcome to Pet clinic')
  end

  context 'owners feature' do
    it 'should load owners landing page' do
      get '/owners'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Find owners')
    end

    it 'Find owners should pass search term' do
      post '/owners/find', name: 'molala'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Search results for molala')
    end
  end


  context 'Vets feature' do
    it 'should load vets page' do
      get '/vets'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Veterinarians')
    end

    it 'and vets page show list of vets and their specialisation' do
      get '/vets'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Veterinarians')
      expect(last_response.body).to include('Name')
      expect(last_response.body).to include('Speciality')
    end
  end

  it 'should load aboutus page' do
    get '/about'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('About this web app')
  end

  context 'Admin feature' do
    it 'should load admin page' do
      get '/admin'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Welcome admin!')
    end

    it 'navigate to owners page' do
      get '/admin/owners'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Owners')
    end

    it 'navigate to add new owner page' do
      get '/admin/owners/new'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Add Owner')
    end

    it 'navigate to manage vets page' do
      get '/admin/vets'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Veterinaries')
    end

    it 'navigate to add new Vet page' do
      get '/admin/vets/new'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Add Veterinarian')
    end
  end


end