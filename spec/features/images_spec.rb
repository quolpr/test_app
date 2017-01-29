require "rails_helper"

RSpec.describe 'Images management', type: :feature do
  let!(:user) { create :user }

  scenario 'Image creating and deleting' do
    visit new_user_image_path(user)
    within('#new_image') do
      attach_file 'image_content', Rails.root.join('spec', 'fixtures', 'rails.png')
    end
    click_button 'Create Image'
    expect(page).to have_content 'successfully created'
    expect(page).to have_css 'img'
    click_link 'Delete'
    expect(page).to have_content 'successfully destroyed'
    expect(page).to have_content 'no any images'
  end
end
