class Rate < ApplicationRecord
  belongs_to :user
  has_many :rate_movies
  has_many :movies, through: :rate_movie

  validates :stars, presence: true, numericality: { in: 1..5 }
  private


end
