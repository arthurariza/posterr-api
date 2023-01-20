# frozen_string_literal: true

class PostCreator < ApplicationService
  def initialize(params = {})
    @params = params
  end

  def call
    Post.create(body: @params[:body], post_type: 0, user_id: @params[:user_id])
  end

  private

  attr_reader :params
end
