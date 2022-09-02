require 'rails_helper'

RSpec.describe 'SessionController', type: :request do
  let (:user) { create_user }
  let (:login_url) { '/api/v1/users/sign_in' }

  context 'When logging in' do
    before do
      login_with_api(user)
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

end
