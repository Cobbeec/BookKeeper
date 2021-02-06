class ReviewsController < ApplicationController
    #before_action:
    #redirect_if_not_logged_in 

    def new 
        @review = Review.new 
    end 
end
