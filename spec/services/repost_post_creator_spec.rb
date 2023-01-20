# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepostPostCreator, type: :service do
  describe '#call' do
    subject(:call_service) { described_class.call(params) }
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    let(:params) do
      {
        user_id: user.id,
        post_id: post.id
      }
    end

    it 'should have created the repost with the given params' do
      call_service

      expect(Post.last.body).to eq(nil)
      expect(Post.last.post_type).to eq('repost')
      expect(Post.last.user_id).to eq(params[:user_id])
      expect(Post.last.post_id).to eq(params[:post_id])
    end
  end
end
