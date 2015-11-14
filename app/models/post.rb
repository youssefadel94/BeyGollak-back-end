class Post < ActiveRecord::Base
    
    #scope :notify, -> { where(n = Notification.create(user_id: friend_id ,notification_content: current_user.email + "posted on your wall") ) }
    #after_create :self.notify
   
    belongs_to :user
    # validating presence of user
    validates :user, presence: true
    belongs_to :reciever, class_name: "User"
    validates :reciever, presence: true
    has_many :comments
    validates_associated :comments
    validates :post_content, presence: true
end
