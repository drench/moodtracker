class User < ApplicationRecord
  has_secure_password
  has_merit
  belongs_to :family

  has_many :journals

  has_many :messages
  has_many :messages_threads, through: :messages

  has_many :badges
  has_many :awards, through: :badges

  has_many :mood_trackers

  validates :name, presence: true, uniqueness: true      
  validates :family_id, presence: true
end
