class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :watchlist_movies
  has_many :movies, through: :watchlist_movies

  def toogle_movie(movie_id)
    movie = Movie.find_by(movie_id: movie_id)

    transaction do  # Início da transação
      if watchlist_movies.exists?(movie_id: movie)
        watchlist_movies.where(movie_id: movie.id).delete_all
        false
      else
        watchlist_movies.create!(movie: movie)
        true
      end
    rescue ActiveRecord::RecordInvalid
      false
    end
  end
end
