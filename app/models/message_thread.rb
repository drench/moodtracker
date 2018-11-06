class MessageThread < ApplicationRecord
  belongs_to :user
  belongs_to :message_id
end
