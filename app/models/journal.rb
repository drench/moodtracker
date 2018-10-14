class Journal < ApplicationRecord
  belongs_to :user

  validates :title, allow_blank: true
  validates :content, presence: true
end
