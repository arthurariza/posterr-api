# frozen_string_literal: true

class RepostPostController < ApplicationController
  def create
    result = RepostPostCreator.call(post_params)

    if result.created?
      render json: { post: result.post }, status: :created
    else
      render json: { errors: result.post.errors }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :post_id)
  end
end
