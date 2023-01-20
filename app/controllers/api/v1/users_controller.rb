# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
      end

      def show
        @user = User.find_by(id: params[:id])
      end
    end
  end
end
