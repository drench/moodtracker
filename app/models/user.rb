class User < ApplicationRecord
  has_secure_password

  belongs_to :family

  has_many :journals

  has_many :messages
  has_many :messages_threads, through: :messages

  has_many :badges
  has_many :awards, through: :badges

  has_many :moodtrackers

  validates :name, presence: true, uniqueness: true      

end
