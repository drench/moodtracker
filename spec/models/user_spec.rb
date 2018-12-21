require 'rails_helper'

RSpec.describe User, type: :model do
  it { pending 'needs a user_badges join table'; is_expected.to have_many(:awards).through(:badges) }
  it { pending 'needs a user_badges join table'; is_expected.to have_many(:badges) }
  it { is_expected.to have_and_belong_to_many(:families) }
  it { is_expected.to have_many(:journals) }
  it { is_expected.to have_many(:messages) }
  it { pending 'needs associations update'; is_expected.to have_many(:messages_threads).through(:messages) }
  it { is_expected.to have_many(:mood_trackers) }
  it { is_expected.to validate_presence_of(:name) }
end
