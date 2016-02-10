class Api::ReviewController < Api::BaseController   
      before_action :authenticate_user! 
      def index
        #Record.count('date', :distinct => true)
        respond_with @reviews_count = Review.count
      end
      def create 
        information = request.raw_post
         data_parsed = JSON.parse(information)
        @review = Review.new(data_parsed)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Order was successfully created.' }
        format.json { render json: @review, status: :created, location: nil }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end

      end
end
