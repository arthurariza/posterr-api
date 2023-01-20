# frozen_string_literal: true

module Api
  module V1
    class QuotePostController < ApplicationController
      def create
        result = QuotePostCreator.call(post_params)

        if result.created?
          render json: { post: result.post }, status: :created
        else
          render json: { errors: result.post.errors }, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:post).permit(:body, :user_id, :post_id)
      end
    end
  end
end
