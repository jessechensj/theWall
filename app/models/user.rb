class User < ActiveRecord::Base
    validates :username, presence: true, length: { minimum: 6 }, uniqueness: true

    has_many :messages
end
