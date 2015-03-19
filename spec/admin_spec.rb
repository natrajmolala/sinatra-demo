describe 'Admin routes' do

  context 'Manage owners' do
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
  end

  context 'Manage vets' do
    before(:each) do
      @vets = {}
      @vets[1] = Vet.new('John', 'Rambo', 'Radiology')
      @vets[2] = Vet.new('Adam', 'Smith', 'X-Ray')
    end

    it 'navigate to manage vets page' do
      allow(PetClinic::VetService).to receive(:all_vets).and_return(@vets)
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