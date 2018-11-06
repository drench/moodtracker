class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :thread_id
end
