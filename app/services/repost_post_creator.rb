# frozen_string_literal: true

class RepostPostCreator < ApplicationService
  def initialize(params = {})
    @params = params
  end

  def call
    Post.create(post_type: 1, user_id: @params[:user_id], post_id: @params[:post_id])
  end
end
