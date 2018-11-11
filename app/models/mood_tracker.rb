class MoodTracker < ApplicationRecord
  belongs_to :user
  has_one :family, through: :user
  
  enum emotion: {angry: 0, sad: 1, meh: 2, happy: 3}, _suffix: true
  
  validates :emotion, presence: true
  
  validates :proud_message, presence: true
  validates :proud_message, length: { minimum: 5 }
  validates :proud_message, length: { maximum: 200 }
end
