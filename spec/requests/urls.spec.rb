require 'rails_helper'

describe 'Url API', type: :request do
  it 'return all urls' do
    get '/api/v1/urls'

  end
end
