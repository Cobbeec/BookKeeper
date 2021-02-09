class BooksController < ApplicationController

    def index 
        if params[:author_id] && @author = Author.find_by_id(params[:author_id])
        @books = @author.books 
        else 
        @error = "That book doesn't exist yet" if params[:author_id]
        @books = Book.all 
    end 
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
