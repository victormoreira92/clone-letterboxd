class Rate < ApplicationRecord
  belongs_to :user
  validates :stars, presence: true, numericality: { in: 1..5 }
  validates :movie_id, presence: true, uniqueness: true

end
