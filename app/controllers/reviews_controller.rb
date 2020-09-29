class ReviewsController < ApplicationController

    def new
        #now a nested route so change id to book_id
        @book = Book.find_by_id(params[:book_id])
        #review object
        @review = @book.build_review
        #so it knows what to associate with and bc its a belomngs ro

        #review belongs to an ice cream
    end 

    def index
    end 
end
