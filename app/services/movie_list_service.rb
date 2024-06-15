class MovieListService < ApplicationService
  def initialize
    @movies = nil
  end

  def call
    get_movies_relasing
  end

  def get_movies_relasing
    Tmdb::Api.key(ENV['SECRET_KEY'])
    @movies = Tmdb::Movie.now_playing.results
  end
end


