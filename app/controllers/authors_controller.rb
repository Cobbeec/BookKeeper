class AuthorsController < ApplicationController
    def index 
        @authors = Author.all 
    end 

    def new 
        @author = Author.new 
    end 

    def create
        @author = Author.create(author_params)
        if @author 
          redirect_to author_path(@author)
        else
          render :new
        end
      end
 

    def show 
        @author = Author.find_by_id(params[:id])
    end 

    def edit 
        @author = Author.find_by_id(params[:id])
    end 

    def update 
    end 

    private 
    def author_params
        params.require(:author).permit(:name)
      end
end
