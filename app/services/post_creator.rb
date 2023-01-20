# frozen_string_literal: true

require './lib/post_result'

class PostCreator < ApplicationService
  def initialize(params = {})
    @params = params
  end

  def call
    post = Post.create(body: @params[:body], post_type: 0, user_id: @params[:user_id])

    PostResult.new(created: post.valid?, post: post)
  end
end
