# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound do |_e|
    render json: { error: 'Not Found' }, status: :not_found
  end
end
