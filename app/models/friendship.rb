class Friendship < ActiveRecord::Base
   
    #attr_reader :friend_id #place in table somehow
    #scope :notify, -> { where(n = Notification.create(user_id: friend_id ,notification_content: current_user.email + "is now your friend") ) }
         belongs_to :user
         belongs_to :friend, class_name: "User"
         validates :user, presence: true
         validates :friend, presence: true
         #validates_uniqueness_of :user_id, :scope => :friend_id
end