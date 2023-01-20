# frozen_string_literal: true

class UserPostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(5)
    render 'posts/index'
  end
end
