require 'rails_helper'

RSpec.describe Following, type: :model do
  it { should belong_to(:follower_user) }
  it { should belong_to(:followed_user) }
end
