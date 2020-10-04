class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in


    def new
        #now a nested route so change id to book_id
       if @book = Book.find_by_id(params[:book_id])
        #review object
        @review = @book.reviews.build
        #so it knows what to associate with and bc its a belomngs ro
    else
        @review = Review.new
      end
        #review belongs to an ice cream
    end 

    def create 
        @review =current_user.reviews.build(review_params)

        if @review.save #validations add to model
            redirect_to review_path(@review)
        else
            render :new
        
        end
    end 

    def show
        @review=Review.find_by_id(params[:id])
        
    end 

    def index
        #matters more to nest bc were seeung all
        if @book = Book.find_by_id(params[:book_id])
            #nested
            @reviews = @book.reviews
          else
            #it's not nested
            @reviews = Review.all
          end
    end 

    private

    def review_params
        params.require(:review).permit(:book_id, :content, :stars, :title)
    end

    
end
