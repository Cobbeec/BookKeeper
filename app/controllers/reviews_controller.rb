class ReviewsController < ApplicationController
    #before_action:
    #redirect_if_not_logged_in 

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @reviews = @user.reviews.all
    else
        @error = "You don't have access to that information." if params[:user_id]
        @reviews = Review.all 
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
        @review = Review.find_by_id(params[:id])
        redirect_to reviews_path if !@review || @review.user != current_user
      end

      def update
        @review = Review.find_by(id: params[:id])
        redirect_to reviews_path if !@review || @review.user != current_user
       if @review.update(review_params)
        # binding.pry 
        redirect_to action: "show" 
       else
         render :new 
       end
     end

     def destroy
      @review = Review.find_by_id(params[:id])
      if logged_in? && @review.user == current_user 
      @review.destroy 
      redirect_to reviews_path
    else 
      flash[:message] = "You do not have access to this file."  
        redirect_to review_path(@review)
    end
  end 


    private
    def review_params 
        params.require(:review).permit(:book_id, :title,:content) #because you have a book object 
    end 

  end 