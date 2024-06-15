class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = FilmRequest.call("Terminator 2")
  end
end
