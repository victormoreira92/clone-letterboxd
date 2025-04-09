class Movie < ApplicationRecord

  has_many :watchlist_movies
  has_many :watchlists, through: :watchlist_movies

end
