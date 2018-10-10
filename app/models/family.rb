class Family < ApplicationRecord
  def family
    User.where(Family: id)
  end
end
