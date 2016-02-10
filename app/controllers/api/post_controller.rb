class Api::PostController < Api::BaseController   
      before_action :authenticate_user! 
      def index     
        respond_with @posts = Post.all
      end 
        def show 
        
        respond_with @comments = Post.where("reciever_id = ? ",params[:id])
        
        end
       def create 
         information = request.raw_post
         data_parsed = JSON.parse(information)
         @post = Post.new(data_parsed)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Order was successfully created.' }
        format.json { render json: @post, status: :created, location: nil }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

      end
      def delete
         @post = Post.find(params[:id])
         if @current_user.id == @post.user_id 
    
            if @post.destroy 
               respond_with @seen = "post was deleted"
            else 
               render 'delete' 
            end 
          else
               respond_with status: :unauthorized 
          end
      end
end
