class Rate < ApplicationRecord
  belongs_to :movie
  belongs_to :user


  validates :stars, presence: true, numericality: { in: 1..5 }

end
