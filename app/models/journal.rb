class Journal < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def friendly_time
    Journal.created_at.strftime("%FT%T")
  end  

end
