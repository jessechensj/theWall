require 'rails_helper'

RSpec.describe User, type: :model do
  #Username field: must be required, must be unique, must be longer than 5 characters
  context 'valid creation of user' do
    it 'should save' do
      user = User.new(username:"new user")
      expect(user).to be_valid
    end
  end

  context 'invalid creation of user' do
    it 'should not save if length of username is less than 6' do
      user = User.new(username:"hello")
      expect(user).to be_invalid
    end
    it 'should not save if name is not unique' do
      User.create(username:"hello world")
      user = User.new(username:"hello world")
      expect(user).to be_invalid
    end
  end
end
