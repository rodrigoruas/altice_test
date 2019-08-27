require 'rails_helper'
RSpec.describe User, type: :model do
  context 'validation_tests' do
    let(:user) { build(:user)}
    it 'ensures first name presence' do
      user = User.new(last_name: "Star", email: "ringo@beatles.com")
      expect(user.save).to eq(false)
    end
    it 'ensures last_name presence' do
      user = User.new(first_name: "Ringo", email: "ringo@beatles.com")
      expect(user.save).to eq(false)
    end
    it 'ensures e-mail presence' do
      user = User.new(first_name: "Ringo", last_name: "Star")
      user.email = nil
      expect(user.save).to eq(false)
    end
    it 'ensures e-mail format' do
      user = User.new(first_name: "Ringo", last_name: "Star", email: "ringobeatles.com")
      user.email = "blablabla"
      expect(user.save).to eq(false)
    end
    it 'should save successfully' do
      user = User.new(first_name: "Ringo", last_name: "Star", email: "ringo@beatles.com", password: "bla")
      expect(user.save).to eq(true)
    end
  end
end
