class Family < ApplicationRecord
  has_many :users
  
  def family
    User.where(Family: id)
  end
end
