# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      def index
        @posts = Post.order(created_at: :desc).page(params[:page]).per(params[:limit])
      end

      def show
        @post = Post.find_by(id: params[:id])
      end

      def create
        result = PostCreator.call(post_params)

        if result.created?
          render json: { post: result.post }, status: :created
        else
          render json: { errors: result.post.errors }, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:post).permit(:body, :user_id)
      end
    end
  end
end
