require 'rails_helper'

RSpec.describe 'RegistrationsController', type: :request do
  let (:user) { build_user }
  let (:existing_user) { create_user }
  let (:signup_url) { '/api/v1/users' }

  context 'When creating a new user' do
    before do
      post signup_url, params: {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

  end
end

