class BooksController < ApplicationController
    def new 
        @book=Books.new
    end 
end
