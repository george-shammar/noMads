require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_many(:opinions) }
    it { should have_many(:likes) }
    it { should have_many(:follower_relationships) }
end
