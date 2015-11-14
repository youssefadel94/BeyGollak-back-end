class Comment < ActiveRecord::Base
    belongs_to :post
    validates :post, presence: true
    belongs_to :user
    validates :user, presence: true
    validates :comment_content, presence: true, length: { maximum: 200 }
end

