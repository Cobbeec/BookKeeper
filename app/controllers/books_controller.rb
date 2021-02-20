class BooksController < ApplicationController

    def self.alphabetize 
        self.order(title: :desc)
    end 

    def index 
        if params[:author_id] && @author = Author.find_by_id(params[:author_id]) #for nesting
        @books = @author.books.alpha
        else 
        @error = "That book doesn't exist yet" if params[:author_id]
        @books = Book.alpha 
    end 
    end 

    def new 
        if params[:author_id] && @author = Author.find_by_id(params[:author_id]) #if nested route
            @book = @author.books.build 
        else 
             @error = "That book does not yet exist" 
            @book = Book.new 
            @book.build_author 
        end 
    end 

    def create
        @book= Book.new(book_params)
        # binding.pry 
        if @book.save #here is where the validations happen 
          redirect_to book_path(@book)
        #   binding.pry 
        else
          render :new #not a new http request 
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
        params.require(:book).permit(:title, :author_id, :genre_id,  author_attributes: [:name])
      end
end
