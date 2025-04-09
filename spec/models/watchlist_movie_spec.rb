require 'rails_helper'

RSpec.describe WatchlistMovie, type: :model do
  describe 'Validations' do
    context 'is valid' do
      it 'with all attributes' do
        expect { create(:watchlist_movie) }.to change(described_class, :count).by(1)
      end
    end

    context "isn't valid" do
      it 'without watchlist' do
        new_watchlist_movie = build(:watchlist_movie, watchlist_id: nil)
        new_watchlist_movie.valid?
        expect(new_watchlist_movie.errors[:watchlist]).to include("must exist")
      end

      it 'without movie' do
        new_watchlist_movie = build(:watchlist_movie, movie: nil)
        new_watchlist_movie.valid?
        expect(new_watchlist_movie.errors[:movie]).to include("must exist")
      end
    end

  end
end
