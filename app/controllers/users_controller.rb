class UsersController < ApplicationController

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to @user 
        else 
            render :new
        end 
    end 

    def show 
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end 

    def index 
        @users = User.all
    end 

    def most_reviews
        @user = User.find_by_id(params[:id])
        @users = User.all.most_reviews
      end



    private 
    def user_params 
        params.require(:user).permit(:name, :username, :email, :password)
    end 

end
