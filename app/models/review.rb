class Review < ActiveRecord::Base
    belongs_to :street
    belongs_to :user
    #validating street, review content and user to be present
    validates :street, presence: true
    validates :user, presence: true
    validates :review_content, presence: true, length: { maximum: 200 }
end
