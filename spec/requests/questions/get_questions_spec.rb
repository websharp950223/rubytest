require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:question, 10)
      get '/api/v1/questions'
    end

    it 'returns all questions' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
