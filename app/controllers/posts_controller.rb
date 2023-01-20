# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(params[:limit])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = PostCreator.call(post_params)

    if Post.exists?(id: @post.id)
      render json: { post: @post }, status: :created
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
