require 'rails_helper'

RSpec.describe Opinion, type: :model do
  it 'counts the number of opinion likes' do
    @user = User.create(fullname: 'Foo', email: 'foo@bar.com', password: '123456789')
    @opinion = Opinion.create(authorid: @user.id, text: 'Post!')
    @like = Like.create(opinion_id: @opinion.id, user_id: @user.id)
    expect(like_count(@opinion).is_a?(Integer)).to be true
  end

  it { should validate_presence_of(:text) }
  
  it { should belong_to(:author) }
  it { should have_many(:likes) }
end
