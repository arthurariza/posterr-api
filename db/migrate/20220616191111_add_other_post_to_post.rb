# frozen_string_literal: true

class AddOtherPostToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :post, foreign_key: true
  end
end
