class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  has_many :opinions, class_name: 'Opinion', foreign_key: 'authorid', dependent: :destroy
  has_many :follower_relationships, class_name: 'Following', foreign_key: 'followerid', dependent: :destroy
  has_many :followed_relationships, class_name: 'FOllowing', foreign_key: 'followedid', dependent: :destroy
  has_many :follower_users, through: :followed_relationships, source: :follower_user
  has_many :followed_users, through: :follower_relationships, source: :followed_user

end
