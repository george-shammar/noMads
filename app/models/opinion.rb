class Opinion < ApplicationRecord
    validates :text, presence: true, length: { maximum: 100,
                                                too_long: '100 characters in opinion is the maximum allowed.' }


    belongs_to :author, class_name: 'User', foreign_key: 'authorid'
    has_many :likes, dependent: :destroy
end


def like_count(opinion)
    @like = Like.where(opinion_id: opinion.id)
    @like.count
end