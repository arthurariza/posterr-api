# frozen_string_literal: true

class RepostPostController < ApplicationController
  def create
    @post = RepostPostCreator.call(post_params)

    if Post.exists?(id: @post.id)
      render json: { post: @post }, status: :created
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :post_id)
  end
end
