class DashboardController < ApplicationController
  before_action :authenticate_user!


  def index
    @movies_latest ||= Tmdb::Movie.latest
    @movies_now_playing ||= Tmdb::Movie.latest
    @movies_upcoming ||= Tmdb::Movie.upcoming
    @movies_top_rated ||= Tmdb::Movie.top_rated
  end

end
