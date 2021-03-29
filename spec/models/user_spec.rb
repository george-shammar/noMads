require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_many(:opinions) }
    it { should have_many(:likes) }
    it { should have_many(:follower_relationships) }
    it { should have_many(:followed_relationships) }
    it { should have_many(:follower_users) }
    it { should have_many(:followed_users) }
    it { should have_one_attached(:image) }
    it { should have_one_attached(:coverimage) }

    it { should validate_presence_of(:username) }
end
