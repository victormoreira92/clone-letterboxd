require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'is valid' do
      it 'with all attributes' do
        expect { create(:user) }.to change(described_class, :count).by(1)
      end
    end

    context 'is invalid' do
      it 'email with diferent format' do
        user = build(:user, email: 'email.123')
        user.valid?
        expect(user.errors[:email]).to include('is invalid')
      end

      %w[email password].each do |atributo|
        it "without #{atributo}" do
          user = build(:user, "without_#{atributo}".to_sym)
          user.valid?
          expect(user.errors[atributo.to_sym]).to include("can't be blank")
        end
      end

    end


  end

  describe '#save_movie_watchlist' do
    it 'add movie in watchlist when exist' do
      
    end
  end
end
