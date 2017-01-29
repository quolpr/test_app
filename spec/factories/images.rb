# frozen_string_literal: true
# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  content    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :image do
    content { File.new(Rails.root.join('spec', 'fixtures', 'rails.png')) }
  end
end
