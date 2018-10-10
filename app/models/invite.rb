class Invite < ApplicationRecord
  has_many :users
  belongs_to :thread_id
end
