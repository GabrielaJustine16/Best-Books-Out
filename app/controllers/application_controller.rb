class ApplicationController < ActionController::Base

    private

    def current_user
        @current_user|| = User.find_by_id(session[:user_id])#findbyid returns nil instead of error
    end 


end
