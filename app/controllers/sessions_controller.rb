class SessionsController < ApplicationController
#login functionality 

    def home 
    end 

 
    def create 
    user = User.find_by_id(params[:id])
    if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
    else  
        redirect_to "/"
    end 
    end 

    def omniauth 
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
 
# def destroy 
#     session.clear 
#     redirect_to root_path 
#     end 

    def destroy
        if current_user
         session.delete :user_id
        redirect_to root_url
        end
     end

    private 
    def auth 
        request.env['omniauth.auth']
    end 

end 