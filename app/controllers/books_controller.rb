class BooksController < ApplicationController

    def index 
        @books = Book.all 
    end 

    def new 
        @book = Book.new 
    end 

    def create
    end 

    def show 
        @book = Book.find_by_id(params[:id])
    end 

    def edit 
        @book = Book.find_by_id(params[:id])
    end 

    def update 
    end 
end
