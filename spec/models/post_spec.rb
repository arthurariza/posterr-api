# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    let!(:repost) { create(:repost) }
    let!(:post) { create(:post) }
    let!(:user) { create(:user) }
    let!(:quote) { create(:quote) }

    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(777) }

    describe 'post_count_cannot_be_greater_than_five_in_a_day' do
      it 'allows a user to create five posts per day' do
        expect { create_list(:post, 5, user: user) }.to change { Post.where(user_id: user.id).count }.from(0).to(5)
      end

      it 'raises error when creating more than five posts but other users can still create posts' do
        user_two = create(:user)

        expect do
          create_list(:post, 6, user: user)
        end.to raise_error(ActiveRecord::RecordInvalid, /You cannot create more than five posts in a day/)

        create_list(:post, 3, user: user_two)

        expect(Post.where(user_id: user_two.id).count).to eq 3
      end
    end

    describe 'repost_post_cannot_be_reposted' do
      it 'raises error when reposting a repost post' do
        expect do
          create(:repost, post_id: repost.id)
        end.to raise_error(ActiveRecord::RecordInvalid, /A repost post cannot be reposted/)
      end

      it 'posts can be reposted' do
        expect do
          create(:repost, post_id: post.id)
        end.not_to raise_error
      end

      it 'quote posts can be reposted' do
        expect do
          create(:repost, post_id: quote.id)
        end.not_to raise_error
      end
    end

    describe 'quote_post_cannot_be_quoted' do
      it 'raises error when quoting a quote post' do
        expect do
          create(:quote, post_id: quote.id)
        end.to raise_error(ActiveRecord::RecordInvalid, /A quote post cannot be quoted/)
      end

      it 'posts can be quoted' do
        expect do
          create(:quote, post_id: post.id)
        end.not_to raise_error
      end

      it 'repost posts can be quoted' do
        expect do
          create(:quote, post_id: repost.id)
        end.not_to raise_error
      end
    end
  end
end
