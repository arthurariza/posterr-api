# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence(:body) { |n| "Post #{n} Body" }
    post_type { 0 }
    user

    factory :repost do
      body { nil }
      post_type { 1 }
      post_id { create(:post) }
    end

    factory :quote do
      sequence(:body) { |n| "Post #{n} Body" }
      post_type { 2 }
      post_id { create(:post) }
    end
  end
end
