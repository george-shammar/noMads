require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_many(:opinions) }
    it { should have_many(:likes) }
    it { should have_many(:follower_relationships) }
    it { should have_many(:followed_relationships) }
    it { should have_many(:follower_users) }
end
