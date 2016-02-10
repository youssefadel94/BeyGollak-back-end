class Api::BaseController < ApplicationController
     skip_before_action :verify_authenticity_token      
     respond_to :json    
     protected      
     def current_user  
        
        @current_user ||= User.find_by(id: 2)#token: request.headers[:authorization])#id: 1)
        
        
     end      
     # token: request.headers[:authorization]
    #  def authenticate_user!     
    #          unless current_user?  
             
    #         # render status: :unauthorized 
             
    #         respond_with status: :unauthorized 
            
            
    #          end   
    #  end 
    
     end