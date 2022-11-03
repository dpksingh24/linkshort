require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'has a Name' do
    url = Url.new(
      name: '',
      website_name: 'Youtube',
      slug: 'yt20'
    )
    expect(url).to_not be_valid
    url.name = 'www.whatsapp.com'
    expect(url).to be_valid
  end

  it 'has a Website Name' do
    url = Url.new(
      name: 'https://www.javapoint.com',
      website_name: '',
      slug: 'yt21'
    )
    expect(url).to_not be_valid
  end

  it 'has a Slug' do
    url = Url.new(
      name: 'https://www.javapoint.com',
      website_name: 'javapoint',
      slug: ''
    )
    expect(url).to be_valid
  end

end
