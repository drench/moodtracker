class Journal < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def friendly_time
    # [@drench] I think you want `self` here instead of `Journal`.
    # Something like this should work:
    #   created_at.strftime('%FT%T')
    #
    # We could also look at this format vs. something like `created_at.iso8601`
    Journal.created_at.strftime("%FT%T")
  end  

end
