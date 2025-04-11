class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :set_watchlist

  has_one :watchlist, dependent: :destroy
  has_many :rates

  def toogle_movie_watchlist(movie_id)
    watchlist.toogle_movie(movie_id)
  end


  private

  def set_watchlist
    Watchlist.create(user_id: id) if watchlist.nil?
  end
end
