require 'rails_helper'

describe 'Url API', type: :request do
  let(:valid_attributes) do
  {
    'id' => '1',
    'name' => 'https://www.test.com',
    'website_name' => 'test',
    'slug' => 'test',
    'count' => '1234'

  }
  end

  let(:invalid_attributes) do
  {
    'id' => 'a',
    'name' => '1',
    'count' => '1234',
    'website_name' => '00',
    'slug' => '',
    'count' => '1a'
  }
  end

describe 'GET /index' do
  it 'render a successful response' do
    url = Url.new(valid_attributes)
    get api_v1_urls_url, as: :json
    expect(response).to be_successful
  end

  it 'render a successful response' do
    url = Url.create! valid_attributes
    get api_v1_urls_url(url), as: :json
    expect(response).to be_successful
  end

end

describe 'POST /create' do
  context 'with valid parameters' do
    it 'create a new post' do
      # expect do
      #   post api_v1_urls_url, params: { url: valid_attributes }, as: :json
      # end.to change(Url.count).by(1)
      url = Url.new(valid_attributes)
      post api_v1_urls_url, params: { url: valid_attributes }, as: :json
      expect { url.save! }.to change(Url, :count).by(1)
    end

    it 'create a new slug' do
      url = Url.new(valid_attributes)
      post api_v1_urls_url, params: { url: valid_attributes }, as: :json
      expect(url.slug).to be_present
    end

  end
end

end
