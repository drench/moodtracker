class Family < ApplicationRecord
  has_many :users
  # [@drench] I'd consider changing this association to something like this:
  #
  #   has_many :members, class_name: 'User'
  #
  # An association like that could let you remove the #family method here:

  def family
    User.where(Family: id)
  end
end
