require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensure name presence' do
      user = User.new(email: "sample@gmail.com").save
      expect(user).to eq(false)
    end

    it 'ensure email presence' do
      user = User.new(name: 'name').save
      expect(user).to eq(false)
    end

    it 'is not valid without name' do
      user = User.name
      user = nil
      expect(subject).to_not be_valid
    end
  end

end
