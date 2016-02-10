class Api::StreetController < Api::BaseController   
    before_action :authenticate_user!      
    def index     
        respond_with @streets = Street.all   
    end      
    def show 
        
        respond_with @reviews = Review.where("street_id = ? ", params[:id])
        
    end
end 