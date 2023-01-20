# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    let!(:posts) { create_list(:post, 25) }

    it 'shows only 10 posts by default' do
      get '/posts'

      parsed_body = JSON.parse(response.body)

      expect(parsed_body.size).to eq 10
      expect(response).to have_http_status(:ok)
    end

    it 'shows a specified amount posts' do
      limit = rand(10)

      get "/posts?limit=#{limit}"

      parsed_body = JSON.parse(response.body)

      expect(parsed_body.size).to eq limit
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /posts/:id' do
    let!(:post) { create(:post) }

    it 'returns a specified post' do
      get "/posts/#{post.id}"

      parsed_body = JSON.parse(response.body)

      expect(parsed_body['post']['id']).to eql(post.id)
      expect(parsed_body['post']['body']).to eql(post.body)
      expect(parsed_body['post']['post_type']).to eql(post.post_type)
      expect(parsed_body['post']['user_id']).to eql(post.user.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /posts' do
    let(:user) { create(:user) }
    it 'returns the created post' do
      post '/posts', params: { post: { body: 'My Post', user_id: user.id } }

      parsed_body = JSON.parse(response.body)

      expect(parsed_body['post']['id']).to eql(Post.last.id)
      expect(parsed_body['post']['body']).to eql('My Post')
      expect(parsed_body['post']['post_type']).to eql('post')
      expect(parsed_body['post']['user_id']).to eql(user.id)
      expect(response).to have_http_status(:created)
    end
  end
end
