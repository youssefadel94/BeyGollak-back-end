class Api::NotificationController < Api::BaseController   
      before_action :authenticate_user! 
       def index     
        respond_with @notifications = Notificationwhere("user_id = ? ", @current_user.id)  
       end  
          
      def seen
      @notification = Notification.find(params[:id])  
      @notification.seen
       
     
      respond_with @seen = "notification seen"
      end
      def show
       respond_with @notifications = Notification.where("user_id = ? ", params[:id])  
      end
end