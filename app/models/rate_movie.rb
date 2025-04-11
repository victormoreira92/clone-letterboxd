class RateMovie < ApplicationRecord
  belongs_to :rate
  belongs_to :movie
end
