require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/movie/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /save_favorite" do
    it "returns http success" do
      get "/movie/save_favorite"
      expect(response).to have_http_status(:success)
    end
  end

end
