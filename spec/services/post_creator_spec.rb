# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostCreator, type: :service do
  describe '#call' do
    subject(:call_service) { described_class.call(params) }
    let(:user) { create(:user) }

    let(:params) do
      {
        body: 'Post Body',
        user_id: user.id
      }
    end

    it 'should have created the post with the given params' do
      call_service

      expect(Post.last.body).to eq(params[:body])
      expect(Post.last.post_type).to eq('post')
      expect(Post.last.user_id).to eq(params[:user_id])
      expect(Post.last.post_id).to eq(nil)
    end
  end
end
