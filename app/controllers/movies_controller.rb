class MoviesController < ApplicationController
  def search
      @movies = SearchMovie.new(search_params[:title]).perform
  end
  
  private
  def search_params
    params.permit(:title)
  end
end

