class Family < ApplicationRecord
  has_and_belongs_to_many :users
  
  # def family
  #   User.where(Family: id)
  # end
end
