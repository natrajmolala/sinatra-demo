describe 'Check routes' do

  it 'should load home page' do
    get '/home'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('Welcome to Pet clinic')
  end

  it 'should find owners page' do
    get '/owners'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('Find owners')
  end

  it 'should load home page' do
    get '/vets'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('Vets home')
  end

end