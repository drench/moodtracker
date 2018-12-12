class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :families

  has_many :journals

  has_many :messages
  has_many :messages_threads, through: :messages

  has_many :badges
  has_many :awards, through: :badges

  has_many :mood_trackers

  validates :name, presence: true, uniqueness: true      
end
