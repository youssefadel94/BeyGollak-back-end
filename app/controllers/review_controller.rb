class ReviewController < ApplicationController
def new 
  @review = Review.new 
  @street = Street.find(params[:id]) 
end
def delete
  @review = Review.find(params[:id]) 
  if @review.destroy 
    redirect_to '/streets' 
  else 
    render 'delete' 
  end 
end
def create 
  @review = Review.new(review_params) 
  
#@review.street_id = @review.id #solve id problem
@id = params[:review][:street_id]
@id = @id.to_i
@review.street_id = @id
 @review.user_id = current_user.id
  if @review.save 
    redirect_to '/streets' 
  else 
    render 'new' 
  end 
end
private 
  def review_params 
    params.require(:review).permit(:comment) 
  end
end
