class BooksController < ApplicationController

    def self.alphabetize 
        self.order(title: :desc)
    end 

    def index 
        if params[:author_id] && @author = Author.find_by_id(params[:author_id]) #for nesting
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
            @book.build_author 
        end 
    end 

    def create
        @book= Book.new(book_params)
        binding.pry 
        if @book.save
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
        params.require(:book).permit(:title, :author_id, :genre_id)
      end
end
