# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts

  validates :username, format: { with: /[a-zA-Z0-9_]*/ }, uniqueness: { case_sensitive: false }
  validates :username, length: { maximum: 14 }
end
