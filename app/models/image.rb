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

class Image < ApplicationRecord
  belongs_to :user
  mount_uploader :content, FavouriteImageUploader

  validates :content, presence: true

  validate :user_image_count

  private

  def user_image_count
    return if user.blank?
    errors[:base] << 'user has too many images' if user.images.count >= 2
  end
end
