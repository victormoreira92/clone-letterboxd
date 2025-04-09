require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe 'Validations' do
    context 'is valid' do
      it 'with all attributes' do
        expect { create(:rate) }.to change(described_class, :count).by(1)
      end
    end

    context 'is invalid' do
      it 'without stars' do
        rate = build(:rate, stars: nil)
        rate.valid?
        expect(rate.errors[:stars]).to include("can't be blank")
      end

      it 'stars less than 1' do
        rate = build(:rate, stars: -1)
        rate.valid?
        expect(rate.errors[:stars]).to include('must be in 1..5')
      end

      it 'stars above 5' do
        rate = build(:rate, stars: 9)
        rate.valid?
        expect(rate.errors[:stars]).to include('must be in 1..5')
      end

    end


  end

end
