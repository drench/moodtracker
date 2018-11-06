class Badge < ApplicationRecord
  has_merit

  belongs_to :user
  belongs_to :award  
end
