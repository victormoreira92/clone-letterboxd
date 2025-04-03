require 'rails_helper'

RSpec.describe "Authentication", type: :request do
  describe "GET /users/sign_up" do
    it "returns http success" do
      get new_user_registration_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'post /users/sign_up' do
    context 'returns 303' do
      it 'when user has all atributes' do
        user = { user:
                {
                  email: 'email@email.com',
                  password: '123456',
                  password_confirmation: '123456'
                }
              }
        post user_registration_url, params: user
        expect(response).to have_http_status(:redirect)
      end
    end
    context 'returns 422' do
      it 'when email is invalid' do
        user = { user:
                {
                  email: 'email.com',
                  password: '123456',
                  password_confirmation: '123456'
                }
              }
        post user_registration_url, params: user
        expect(response).to have_http_status(422)
      end
      it 'when password and password_confirmation not match' do
        user = { user:
                {
                  email: 'email.com',
                  password: '',
                  password_confirmation: '123456'
                }
              }
        post user_registration_url, params: user
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'POST /users/sign_in' do
    context 'returns 303' do
      it 'when user has all atributes' do
        user = create(:user)
        user_params = { user:
                {
                  email: user.email,
                  password: user.password
                }
              }
        post user_session_path, params: user_params
        expect(response).to have_http_status(:redirect)
      end
    end
    context 'returns 422' do
      it 'when email is wrong' do
        user = create(:user)
        user_params = { user:
                {
                  email: 'email@email.com',
                  password: user.password
                }
              }
        post user_session_path, params: user_params
        expect(response).to have_http_status(422)
      end
      it 'when password is wrong' do
        user = create(:user)
        user_params = { user:
                {
                  email: user.email,
                  password: '255255'
                }
              }
        post user_session_path, params: user_params
        expect(response).to have_http_status(422)
      end
    end
  end
end
