class AuthorsController < ApplicationController
    before_action :redirect_if_not_logged_in


    def index
      @Author = Author.alpha
    end
end
