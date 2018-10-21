class MoodTracker < ApplicationRecord
  belongs_to :user
  enum emotion: {fear: 0, anger: 1, sad: 2, joy: 3, shame: 4, disgust: 5, surprise: 6, pity: 7, envy: 8, love: 9 }, _suffix: true
  validates :emotion, presence: true
  
  validates :proud_message, presence: true
  validates :proud_message, length: { minimum: 20 }
  validates :proud_message, length: { maximum: 200 }


end
