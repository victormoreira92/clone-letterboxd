class HomeController < ApplicationController
  before_action :movies_upcomming

  def index; end

  private

  def movies_upcomming
    @movies_upcomming ||= Tmdb::Movie.now_playing[:results].sort_by(&:popularity)
  end

  def require_login
    if logged_in?
      redirect_to dashboard_index_path
    end
  end
end
