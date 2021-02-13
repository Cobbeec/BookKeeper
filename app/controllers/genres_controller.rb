class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre= Genre.new(genre_params)
    # binding.pry 
    if @genre.save
      redirect_to genre_path(@genre)
    else
      render :new
    end
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

  

  def update
    @genre.update(genre_params)
    if @genre.save
      redirect_to attraction_path(@genre)
    else
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :author_id) 
  end
end


