class SessionsController < ApplicationController
#login functionality 

    def home 
    end 

    def destroy 
    session.clear 
    redirect_to root_path 
    end 

    def create 
    user = User.find_by_id(params[:id])
    if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
    else  
        redirect_to "/login"
    end 
    end 

    def omniauth 
    end 

end 