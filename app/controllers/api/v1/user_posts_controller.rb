# frozen_string_literal: true

module Api
  module V1
    class UserPostsController < ApplicationController
      def index
        @posts = Post.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(5)
        render 'api/v1/posts/index'
      end
    end
  end
end
