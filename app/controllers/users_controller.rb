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
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end 

    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end 

    #signup goes here 
end
