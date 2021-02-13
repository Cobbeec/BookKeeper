class ReviewsController < ApplicationController
    #before_action:
    #redirect_if_not_logged_in 

    def index 
        @reviews = Review.all 
    end 

    def show 
        # binding.pry 
        @review = Review.find_by_id(params[:id])
    end 

    def new
        @review = Review.new 
      end

    def create 
        # binding.pry 
        @review = current_user.reviews.build(review_params)
        if @review.save 
            redirect_to reviews_path 
        else 
            render :new 
        end 
    end 

    def edit
        @review = Review.find_by_id(params[:id])
        redirect_to posts_path if !@review || @review.user != current_user
      end

    private
    def review_params 
        params.require(:review).permit(:book_id, :title,:content) #because you have a book object 
    end 
end