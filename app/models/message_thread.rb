class MessageThread < ApplicationRecord
  belongs_to :message_thread
  belongs_to :invite
  belongs_to :user
end
