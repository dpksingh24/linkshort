require 'rails_helper'

describe 'User API', type: :request do
  it 'return all users' do
  FactoryBot.create(:user, name: 'xyz', email: 'xyz@gmail.com', password: 'password')
  FactoryBot.create(:user, name: 'abc', email: 'abc@gmail.com', password: 'password')
  get '/users'
  expect(response).to have_http_status(:success)
  # expect(JSON.parse(response.body).size).to eq(3)
  end
end
