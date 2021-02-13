class ReviewsController < ApplicationController
    #before_action:
    #redirect_if_not_logged_in 

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @reviews = @user.reviews.all
    else
        @error = "That user doesn't exist" if params[:user_id]
        @reviews = Review.all 
      end 
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

      def update
        @review = Review.find_by(id: params[:id])
        redirect_to reviews_path if !@review || @review.user != current_user
       if @review.update(review_params)
         redirect_to review_path(@review)
       else
         render :edit
       end
     end


    private
    def review_params 
        params.require(:review).permit(:book_id, :title,:content) #because you have a book object 
    end 
end