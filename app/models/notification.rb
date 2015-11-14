class Notification < ActiveRecord::Base
    
    belongs_to :user
    validates :user, prescence: true
    validates :notification_content, prescence: true
end
