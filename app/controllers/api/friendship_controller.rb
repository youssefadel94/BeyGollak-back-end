class Api::FriendshipController < Api::BaseController   
      before_action :authenticate_user! 
        def index     
         
        
        respond_with @friends = Friendship.all
        end 
      
        def show     
           @friends = Friendship.find_by("friend_id = ? OR user_id = ?", params[:id], params[:id]) 
        if @friends.nil?
          respond_with @friends = "[]"
        else
        respond_with @friends = User.joins("JOIN friendships ON friendships.friend_id = users.id OR friendships.user_id = users.id").where("users.id != ? AND (friendships.friend_id = ? OR friendships.user_id = ?) ", params[:id], params[:id], params[:id])
        end
        end 
       def create 
           information = request.raw_post
         data_parsed = JSON.parse(information)
        @friendship = Friendship.new(data_parsed)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to @friendship, notice: 'Order was successfully created.' }
        format.json { render json: @friendship, status: :created, location: nil }
      else
        format.html { render action: "new" }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end

      end
      
          def delete
           
            @friend = Friendship.find(params[:id])
            
            if @friend.destroy 
               respond_with @seen = "friend was unfrinded"
            else 
               render 'delete' 
            end 
        
          end
end
