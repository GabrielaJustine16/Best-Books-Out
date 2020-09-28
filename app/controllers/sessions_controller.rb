class SessionsController < ApplicationController

    def welcome 
    end 

    def desroy
        session.delete(:user_id)
        redirect_to '/'
    end 

    def new 

    end 

    def create 
        #does the user exist.
        @user = User.find_by(username: params[:user][:username])
        #did we find someone and did they use the correct password
        #if @user && @user.authenticate(params[:user][:password])

        if @user && @user.authenticate(password: params[:user][:password])
            #whatever method try is called on, if the user isnt nil then the userauthenticating the password params against what the user put in as password
            #if user is found authenticate will be run, if not it will be nil and not run at all
            #below, store the in our session
            session[:user_id] = @user.id
            redirect_to user_path(@User)

        
        else 

            #if they dont corectly log in

            flash[:error] = "Sorry, login information was incorrect. PLease try again!"

            redirect_to login_path
        end 
    end 

end
