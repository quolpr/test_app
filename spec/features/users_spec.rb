# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'user actions', type: :feature do
  describe 'show' do
    let!(:user) { create :user }

    it 'renderes user profile' do
      visit user_path(user)
      expect(page).to have_content user.name
    end
  end
end
