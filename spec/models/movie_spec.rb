require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Validations' do
    context 'is valid' do
      it 'with all attributes' do
        expect { create(:movie) }.to change(described_class, :count).by(1)
      end
    end

    context "isn't valid" do
      it 'same movie_id created' do
        create(:movie, movie_id: 550)
        new_movie = build(:movie, movie_id: 550)
        new_movie.valid?
        expect(new_movie.errors[:movie_id]).to include('has already been taken')
      end

      it 'movie_id blank' do
        new_movie = build(:movie, movie_id: '')
        new_movie.valid?
        expect(new_movie.errors[:movie_id]).to include("can't be blank")
      end
    end

  end

end
