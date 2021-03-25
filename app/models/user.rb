class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image, dependent: :destroy

  has_many :opinions, class_name: 'Opinion', foreign_key: 'authorid', dependent: :destroy

  has_many :follower_relationships, class_name: 'Following', foreign_key: 'followerid', dependent: :destroy
  has_many :followed_relationships, class_name: 'FOllowing', foreign_key: 'followedid', dependent: :destroy
  has_many :follower_users, through: :followed_relationships, source: :follower_user
  has_many :followed_users, through: :follower_relationships, source: :followed_user


# method2
  
  # def follow(user)
  #   followed_users << user if !self.following?(user) and !self.following?(user)
  # end

  # method1
  def unfollow(user)
    followed_users.delete(user)
  end
# method1
  def following?(user)
    followed_users.include?(user)
  end


end
