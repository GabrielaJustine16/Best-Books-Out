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
        if params[:provider] == 'google_oauth2'
            @user = User.create_by_google_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
      
        elsif params[:provider] == 'github'
            @user = User.create_by_github_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            #does the user exist.
            @user = User.find_by(username: params[:user][:username])
            #did we find someone and did they use the correct password
            #if @user && @user.authenticate(params[:user][:password])

            if @user && @user.authenticate(password: params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@User)
            else 

                flash[:error] = "Sorry, login information was incorrect. Please try again!"
                redirect_to login_path
            end 
        end 
    end

    def omniauth
        @user = User.create_by_google_omniauth(auth)
    
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
    
      private
    
    def auth
        request.env['omniauth.auth']
    end

end
