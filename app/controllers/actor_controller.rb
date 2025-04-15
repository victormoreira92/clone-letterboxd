class ActorController < ApplicationController
  before_action :set_actor
  def show
    @credits = Tmdb::Person.movie_credits(params[:id])
    @crews = Tmdb::Person.movie_credits(params[:id])[:crew].pluck(:department).uniq
    @cast = Tmdb::Person.movie_credits(params[:id])[:crew]
    @images = Tmdb::Person.images(params[:id])
  end

  private
  def set_actor
   @actor = Tmdb::Person.detail(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:actor_id)
  end
end
