class Movie < ApplicationRecord

  has_many :watchlist_movies
  has_many :watchlists, through: :watchlist_movies

  has_many :rate_movies
  has_many :rates, through: :rate_movie

end
