class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update ]

    def self.alphabetize 
        self.order(title: :desc)
    end 

    def index 
        if params[:author_id] && @author = Author.find_by_id(params[:author_id]) 
        @books = @author.books.alpha
        else 
        @error = "That book doesn't exist yet" if params[:author_id]
        @books = Book.alpha 
    end 
        if params[:q]
          @posts = @posts.search(params[:q])
    end 

    def new 
        if params[:author_id] && @author = Author.find_by_id(params[:author_id]) 
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
        if @book.save 
          redirect_to book_path(@book)
        #   binding.pry 
        else
          render :new 
        end
      end
 

    def show 
    end 

    def edit 
    end 

    def update 
    end 

 
    private 
    def book_params
        params.require(:book).permit(:title, :author_id, :genre_id,  author_attributes: [:name])
      end

      def set_book  
        @book = Book.find_by_id(params[:id])
      end 
end
