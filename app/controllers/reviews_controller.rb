class ReviewsController < ApplicationController
  before_action :find_review, :redirect_if_not_owner, only: [:edit, :update, :destroy]

  def self.alphabetize 
    self.order(title: :desc)
  end 

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @reviews = @user.reviews.alpha
    else
        @error = "You don't have access to that information." if params[:user_id]
        @reviews = Review.alpha 
      end 
    end 

    def show 
        # binding.pry 
        @review = Review.find_by_id(params[:id])
        @book = @review.book 
    end 

    def new
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @review = @user.reviews.build
      else
        @review = Review.new
      end
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
      end


      def update
       if @review.update(review_params)
        # binding.pry 
        redirect_to action: "show" 
       else
         render :new 
       end
      end 
  

     def destroy
      @review.destroy 
      redirect_to reviews_path
    end
 

   private
    def review_params 
        params.require(:review).permit(:book_id, :title,:content) #because you have a book object 
    end 

    def find_review
      @review = Review.find(params[:id])
  end

    def redirect_if_not_owner
      if @review.user != current_user
          redirect_to user_path(current_user), alert: "You don't have access to this data!" 
      end
  
 end 
end 