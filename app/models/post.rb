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
    
     validate :users_are_friends

         def users_are_friends
           combinations = ["(user_id = '#{user_id}' AND friend_id = '#{reciever_id}')",
           "(user_id = '#{reciever_id}' AND friend_id = '#{user_id}')"]
           if Friendship.where(combinations.join(' OR ')).exists? || user_id == reciever_id then
               
           else
                self.errors.add(:user_id, 'not friends can not post!')
           end
         end
    
    #adding notification 
             after_save :notify
             
            def notify
                if user_id != reciever_id then 
                   Notification.create(user_id: reciever_id ,notification_content: user_id.to_s+" "+"posted on your wall")
                end
            end
         
end
