class Message < ActiveRecord::Base
  validates :user, presence: true
  validates :message, presence: true, length: { minimum: 11 }

  belongs_to :user
end
