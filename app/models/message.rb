class Message < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :messages_threads, through: :messages 

end

