class Api::UserController < Api::BaseController
    def index
    respond_with @users = User.all
    end
    
    def show 
       respond_with @user = User.find(params[:id]) 
    end
    
     def create
         information = request.raw_post
         data_parsed = JSON.parse(information)
    # begin
    #   fb_response = FbGraph2::User.new(params[:access_token]).fetch(fields: [:name, :id, :first_name, :last_name])
      @user = User.find_by(facebook_id: data_parsed['facebook_id'])
       if @user.nil?
         @user = User.new(facebook_id: data_parsed['facebook_id'], email: data_parsed['email'], first_name: data_parsed['first_name'], last_name: data_parsed['last_name'])
         respond_to do |format|
      if @user.save
        #  session[:token] = @user.token
        format.html { redirect_to @user, notice: 'Order was successfully created.' }
        format.json { render json: @user, status: :created, location: nil }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
       else
        #   session[:token] = @user.token
         redirect_to action: "show", id: @user.id
       end
    #   render json: { token: user.authentication_token }, status: status
    # # rescue FbGraph2::Exception => e
    # #     raise_api_error(ApiError.new(ApiError::INVALID_OAUTH_TOKEN))
    # end
  end
end
