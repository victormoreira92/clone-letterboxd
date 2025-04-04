class MovieController < ApplicationController
  before_action :set_movie

  def show
    @cast = Tmdb::Movie.cast(params[:id])
    @crew = Tmdb::Movie.crew(params[:id])
    @similar = Tmdb::Movie.similar(params[:id])
  end

  def save_favorite
  end

  private

  def set_movie
    @movie = Tmdb::Movie.detail(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:movie_id)
  end
end
