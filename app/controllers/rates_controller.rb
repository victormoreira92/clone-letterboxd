class RatesController < ApplicationController
  before_action :set_rate
  
  def create
    respond_to do |format|
      @rate = Rate.new(rate_params)
      movie_id = Movie.find_or_create_by(movie_id: movie_id).id

      @rate.movie_id = movie_id
      if @rate.save
        flash[:success] = "Movie was rate sucessfull"
        format.html { redirect_to movie_path(@movie.id) }
      else
        format.html { redirect_to  }
      end
    end
  end

  def update
    respond_to do |format|
      if @rate.update(rate_params)
        format.html { render json: { stars: @rate.stars } }
      else
        format.json { render json: { error: @rate.errors.full_messages } }
      end
    end
  end

  private

  def set_rate
    @rate = Rate.find(params[:id])
    @movie = Tmdb::Movie.detail(params[:movie_id])
  end


  def rate_params
    params.require(:rate).permit(:movie_id, :user_id, :stars, :spoiler, :review)
  end
end
