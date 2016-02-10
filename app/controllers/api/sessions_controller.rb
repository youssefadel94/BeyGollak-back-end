class Api::SessionsController < Api::BaseController   
     
     def create
           information = request.raw_post
         data_parsed = JSON.parse(information)
          @user = User.find_by(id: data_parsed['id'])
         if @user.nil?
          status = :created 
         else
              redirect_to action: "index"
         end
     end    
   
end
