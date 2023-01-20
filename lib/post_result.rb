# frozen_string_literal: true

class PostResult
  attr_reader :post

  def initialize(created:, post:)
    @created = created
    @post = post
  end

  def created?
    @created
  end
end
