# frozen_string_literal: true

Rails.application.routes.draw do
  defaults format: :json do
    namespace :api do
      namespace :v1 do
        resources :users, only: %i[index show] do
          get 'posts/', to: 'user_posts#index', as: 'posts'
        end

        resources :posts, except: %i[edit update destroy]
        post 'posts/quote/', to: 'quote_post#create', as: 'quote'
        post 'posts/repost/', to: 'repost_post#create', as: 'repost'
      end
    end
  end
end
