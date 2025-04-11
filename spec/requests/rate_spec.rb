require 'rails_helper'

RSpec.describe "Rates", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/rate/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/rate/update"
      expect(response).to have_http_status(:success)
    end
  end

end
