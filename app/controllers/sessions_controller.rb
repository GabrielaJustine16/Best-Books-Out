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

        
    end 

end
