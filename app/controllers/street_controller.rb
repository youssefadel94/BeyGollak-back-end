class StreetController < ApplicationController
    def index
        @streets = Street.all
    end
    def show 
  @street = Street.find(params[:id]) 
  @reviews = Review.all
    end
end
