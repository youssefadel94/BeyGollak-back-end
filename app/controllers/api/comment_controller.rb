class Api::CommentController < Api::BaseController   
      before_action :authenticate_user! 
     
      def index
        respond_with @comments_count = Comment.count
      end
      
      def show 
         
        respond_with @comments = Comment.where("post_id = ? ", params[:id])
      end
       def create 
           information = request.raw_post
         data_parsed = JSON.parse(information)
        @comment = Comment.new(data_parsed)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Order was successfully created.' }
        format.json { render json: @comment, status: :created, location: nil }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

      end
      
       def delete
         @comment = Comment.find(params[:id])
         if @current_user.id == @comment.user_id 
    
            if @comment.destroy 
               respond_with @seen = "comment was deleted"
            else 
               render 'delete' 
            end 
          else
               respond_with status: :unauthorized 
          end
      end
end      
