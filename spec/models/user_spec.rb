# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it { should allow_value('user one').for(:username) }
    it { should allow_value('user_one').for(:username) }
    it { should validate_length_of(:username).is_at_most(14) }
  end
end
