require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_question) { FactoryBot.create(:question) }

      before do
        post '/api/v1/questions', params: {
          question: {
            title: my_question.title,
            body: my_question.body
          }
        }
      end

      it 'returns the title' do
        expect(json['title']).to eq(my_question.title)
      end

      it 'returns the content' do
        expect(json['body']).to eq(my_question.body)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/questions', params: {
          question: {
            title: '',
            body: ''
          }
        }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
