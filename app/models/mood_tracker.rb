class MoodTracker < ApplicationRecord
  belongs_to :user

   enum mood: {fear: 0, anger: 1, sad: 2, joy: 3, shame: 4, disgust: 5, surprise: 6, pity: 7, envy: 8, love: 9 }


end
