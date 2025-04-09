require 'rails_helper'

RSpec.describe Watchlist, type: :model do
  describe 'Validations' do
    context 'is valid' do
      it 'with all attributes' do
        expect { create(:watchlist) }.to change(described_class, :count).by(2)
      end
    end

    context "isn't valid" do
      it 'without user' do
        new_watchlist = build(:watchlist, user_id: nil)
        new_watchlist.valid?
        expect(new_watchlist.errors[:user]).to include('must exist')
      end
    end
  end
end
