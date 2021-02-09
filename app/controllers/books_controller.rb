class BooksController < ApplicationController

    def index 
        @books = Book.all 
    end 

    def new 
        @book = Book.new 
    end 

    def create
        @book= Book.create(book_params)
        if @book
          redirect_to book_path(@book)
        else
          render :new
        end
      end
 

    def show 
        @book = Book.find_by_id(params[:id])
    end 

    def edit 
        @book = Book.find_by_id(params[:id])
    end 

    def update 
    end 

    private 
    def book_params
        params.require(:book).permit(:title, :author, :genre)
      end
end
