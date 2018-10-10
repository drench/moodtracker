class User < ApplicationRecord
  has_secure_password
  belongs_to :family
  validates :name, presence: true, uniqueness: true

  has_many :journals
  has_many :messages
  has_many :messages_threads, through: :messages 
  has_many :invites
  has_many :messages_threads, through: :messages
end
