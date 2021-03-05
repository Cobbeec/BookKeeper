class SessionsController < ApplicationController


  def destroy
    session.clear
    flash[:message] = "Goodbye!"
    redirect_to root_path
   end
 
    def create 
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
        flash[:message] = "Hello and Welcome!" 
    else  
        flash[:message] = "Invalid Credentials! Please try again"
        redirect_to "/" 
    end 
    end 

    def omniauth #create or login a user via Google 
        # binding.pry 
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
    end 
        if user.valid? 
            session[:user_id] = user.id 
            redirect_to new_review_path 
        else 
            flash[:message] = user.errors.full_messages.join(",")
            redirect_to reviews_path 
    end 
    end 
 

    private #private to request auth hash
    def auth 
        request.env['omniauth.auth']
    end 

end 