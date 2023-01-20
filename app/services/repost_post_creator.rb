# frozen_string_literal: true

require './lib/post_result'

class RepostPostCreator < ApplicationService
  def initialize(params = {})
    @params = params
  end

  def call
    post = Post.create(post_type: 1, user_id: @params[:user_id], post_id: @params[:post_id])

    PostResult.new(created: post.valid?, post: post)
  end
end
