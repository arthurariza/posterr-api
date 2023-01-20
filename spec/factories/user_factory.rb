# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "User #{n}" }
  end
end
