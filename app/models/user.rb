class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 20 }
  
  has_one_attached :image, dependent: :destroy
  has_one_attached :coverimage, dependent: :destroy

  has_many :opinions, class_name: 'Opinion', foreign_key: 'authorid', dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :follower_relationships, class_name: 'Following', foreign_key: 'followerid', dependent: :destroy
  has_many :followed_relationships, class_name: 'FOllowing', foreign_key: 'followedid', dependent: :destroy
  has_many :follower_users, through: :followed_relationships, source: :follower_user
  has_many :followed_users, through: :follower_relationships, source: :followed_user

  
  def unfollow(user)
    followed_users.delete(user)
  end

  def following?(user)
    followed_users.include?(user)
  end

end
