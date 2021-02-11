class BooksController < ApplicationController

    def self.alphabetize 
        self.order(title: :desc)
    end 

    def index 
        if params[:author_id] && @author = Author.find_by_id(params[:author_id])
        @books = @author.books 
        else 
        @error = "That book doesn't exist yet" if params[:author_id]
        @books = Book.all #you can add a scope method here. Like ordered by price
    end 
end 

    def new 
        if params[:author_id] && Author.find_by_id(params[:author_id])
            @book = @author.books.build 
        else 
            @error = "That book does not yet exist" if params[:author_id]
            @book = Book.new 
        end 
    end 

    def create
        binding.pry 
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
