class ReviewsController < ApplicationController

    def new
        #now a nested route so change id to book_id
        @book = Book.find_by_id(params[:book_id])
        #review object
        @review = @book.reviews.build
        #so it knows what to associate with and bc its a belomngs ro

        #review belongs to an ice cream
    end 

    def create 
        @review = Review.new(review_params)
        if @review.save #validations add to model
            redirect_to review_path(@review)
        else
            render :new
        
        end
    end 

    def show
        
    end 

    def index
        #matters more to nest bc were seeung all
    end 

    def review_params
        params.require(:review).permit(:book_id, :content, :stars, :title)
    end

    
end
