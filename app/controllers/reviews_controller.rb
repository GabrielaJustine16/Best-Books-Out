class ReviewsController < ApplicationController

    def new
        @book = Book.find_by_id(params[:id])
        #review object
        @review = @book.build_review
        #so it knows what to associate with and bc its a belomngs ro

        #review belongs to an ice cream
    end 

    def index
    end 
end
