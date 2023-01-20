# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :other_post, class_name: 'Post', optional: true

  validates :body, presence: true, unless: :repost?
  validates :body, length: { maximum: 777 }
  validate :post_count_cannot_be_greater_than_five_in_a_day, :repost_post_cannot_be_reposted,
           :quote_post_cannot_be_quoted

  enum post_type: {
    post: 0,
    repost: 1,
    quote: 2
  }

  def repost?
    post_type == 'repost'
  end

  def quote?
    post_type == 'quote'
  end

  def post_count_cannot_be_greater_than_five_in_a_day
    post_count = Post.where('created_at >= ? AND user_id = ?', Time.zone.now.beginning_of_day, user_id).count

    errors.add(:id, 'You cannot create more than five posts in a day') if post_count >= 5
  end

  def repost_post_cannot_be_reposted
    return if post_id.nil?

    errors.add(:post_id, 'A repost post cannot be reposted') if Post.find_by_id(post_id).repost? && repost?
  end

  def quote_post_cannot_be_quoted
    return if post_id.nil?

    errors.add(:post_id, 'A quote post cannot be quoted') if Post.find_by_id(post_id).quote? && quote?
  end
end
