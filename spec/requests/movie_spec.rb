require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let(:user) { create(:user) }

  describe "GET /show" do

    it "returns http success" do
      get "/movie/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /save_favorite' do
    before { sign_in_user(user) }
    it 'returns http success' do
      movie = { movie: { movie_id: '550' } }
      post save_movie_watchlist_movie_path(550), params: movie
      expect(response).to have_http_status(:success)
    end
  end
end
