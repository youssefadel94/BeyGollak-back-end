class Comment < ActiveRecord::Base
    belongs_to :post
    validates :post, presence: true
    belongs_to :user
    validates :user, presence: true
    validates :comment_content, presence: true, length: { maximum: 200 }
    
     validate :users_are_friends

         def users_are_friends
             
             
         if Post.where("(id = #{post_id})").exists?
           combinations = ["(user_id = #{user_id} AND friend_id = #{post.reciever_id})",
           "(user_id = #{post.reciever_id} AND friend_id = #{user_id})"]
           if Friendship.where(combinations.join(' OR ')).exists? || user_id == post.reciever_id then
               
           else
                self.errors.add(:user_id, 'not friends can not post!')
           end
         end
         end
     #adding notification 
             after_save :notify
             
            def notify
                if post.reciever_id != user_id then 
                   Notification.create(user_id: post.reciever_id ,notification_content: user_id.to_s+" "+"commented on your post")
                end
            end
end

