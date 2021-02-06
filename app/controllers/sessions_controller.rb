class SessionsController < ApplicationController
#login functionality 

def home 
end 

def destroy 
    session.clear 
    redirect_to root_path 

end 