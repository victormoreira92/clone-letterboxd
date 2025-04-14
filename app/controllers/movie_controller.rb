class MovieController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie

  def show
    @cast = Tmdb::Movie.cast(params[:id])
    @crew = Tmdb::Movie.crew(params[:id])
    @similar = Tmdb::Movie.similar(params[:id])
    @rate = current_user.rates.find_by(movie_id: params[:id])
    @videos = Tmdb::Movie.videos(params[:id]).select { |video| video.type == 'Trailer' }
  end

  def save_movie_watchlist
    respond_to do |format|
      if current_user.toogle_movie_watchlist(params[:id])
        format.js { flash[:notice] = "The message was sent" }
        format.json { render json: { toogle_movie: 'add_movie', message: t('message.add_movie_watchlist', title: @movie.title) } }
      else
        format.json { render json: { toogle_movie: 'remove_movie', message: t('message.remove_movie_watchlist', title: @movie.title) } }
      end
    end
  end

  private

  def set_movie
    @movie = Tmdb::Movie.detail(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:movie_id, :title, :stars)
  end
end
