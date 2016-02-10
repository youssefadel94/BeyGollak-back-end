class Notification < ActiveRecord::Base
    
    belongs_to :user
    validates :user, presence: true 
    validates :notification_content, presence: true
    
    def seen
      self.seen = true
      save
    end
    
end
