class Friendship < ActiveRecord::Base
   
    #attr_reader :friend_id #place in table somehow
    #scope :notify, -> { where( Notification.create(user_id: friend_id ,notification_content: current_user.email + "is now your friend") ) }
         belongs_to :user
         belongs_to :friend, class_name: "User"
         validates :user, presence: true
         validates :friend, presence: true
         #validates :user_id, uniqueness: {scope: :friend_id}
         
         validate :users_are_not_already_friends

         def users_are_not_already_friends
           combinations = ["(user_id = #{user_id} AND friend_id = #{friend_id})",
           "(user_id = #{friend_id} AND friend_id = #{user_id})"]
           if Friendship.where(combinations.join(' OR ')).exists?
             self.errors.add(:user_id, 'Already friends!')
           end
         end
         
         before_validation :friend_myself


             def friend_myself
                errors.add(:key, "This is your error message") if user_id == friend_id
             end
             #adding notification 
             after_save :notify
             
            def notify
            Notification.create(user_id: friend_id ,notification_content: user_id.to_s+" "+"is now your friend")
            end
         
end


