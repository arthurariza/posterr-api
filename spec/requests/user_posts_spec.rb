# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserPosts', type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 25, user_id: user.id, created_at: rand(30).days.ago) }

  describe 'GET /api/v1/users/:id/posts' do
    it 'shows only five posts' do
      get "/api/v1/users/#{user.id}/posts"

      parsed_body = JSON.parse(response.body)

      expect(parsed_body.size).to eq 5
      expect(response).to have_http_status(:ok)
    end

    it 'only shows posts from specified user' do
      get "/api/v1/users/#{user.id}/posts"

      parsed_body = JSON.parse(response.body)

      ids = []
      parsed_body.each { |n| ids.push n['user_id'] }

      expect(ids).to all(be == user.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
