require 'rails_helper'

RSpec.describe Message, type: :model do
  #Message field: must be required, must be longer than 10 characters
  #User Reference field: must be required
  context 'valid message' do
    it 'should add message' do
      message = Message.new(message:"the message", user: User.new(username:"name"))
      expect(message).to be_valid
    end
  end

  context 'invalid messages' do
    it 'should not add message if message length less than 10' do
      message = Message.new(user:User.new(username:"name"))
      expect(message).to be_invalid
    end
    it 'should not add message if it does not belong to a user' do
      message = Message.new(message:"adequate length")
      expect(message).to be_invalid
    end
  end
end
