describe 'Pet clinic routes' do

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

    before(:each) do
      @vets = {}
      @vets[1] = Vet.new('John', 'Rambo', 'Radiology')
      @vets[2] = Vet.new('Adam', 'Smith', 'X-Ray')
    end

    it 'should load vets page' do
      allow(PetClinic::VetService).to receive(:all_vets).and_return(@vets)

      get '/vets'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Veterinarians')
    end

    it 'and vets page show list of vets and their specialisation' do
      allow(PetClinic::VetService).to receive(:all_vets).and_return(@vets)
      get '/vets'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Veterinarians')
      expect(last_response.body).to include('Name')
      expect(last_response.body).to include('Speciality')
      expect(last_response.body).to include('John&nbsp;Rambo')
    end
  end

  it 'should load aboutus page' do
    get '/about'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('About this web app')
  end



end