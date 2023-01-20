# frozen_string_literal: true

class QuotePostCreator < ApplicationService
  def initialize(params = {})
    @params = params
  end

  def call
    Post.create(body: @params[:body], post_type: 2, user_id: @params[:user_id], post_id: @params[:post_id])
  end
end
