# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /api/v1/users' do
    it 'lists all users' do
      create_list(:user, 10)
      get '/api/v1/users'

      parsed_body = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(parsed_body.size).to eq User.all.count
    end
  end

  describe 'GET /api/v1/users/:id' do
    let!(:user) { create(:user) }

    it 'lists specified user' do
      get "/api/v1/users/#{user.id}"

      parsed_body = JSON.parse(response.body)

      expect(parsed_body['user']['id']).to eql(user.id)
      expect(parsed_body['user']['username']).to eql(user.username)
      expect(response).to have_http_status(:ok)
    end
  end
end
