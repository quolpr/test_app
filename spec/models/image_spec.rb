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

require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should belong_to :user }

  it { should validate_presence_of(:content) }

  describe 'image count validation' do
    subject { FactoryGirl.build :image, user: user }
    let(:user) { FactoryGirl.build :user }

    before do
      allow(user.images).to receive(:count).and_return(images_count)
    end

    context 'user has 2 images' do
      let(:images_count) { 2 }

      it 'returns validation error' do
        subject.valid?
        expect(subject.errors[:base]).to include(/too many images/)
      end
    end

    context 'user has less then 2 images' do
      let(:images_count) { 0 }

      it 'return nothing' do
        subject.valid?
        expect(subject.errors[:base]).not_to include(/too many images/)
      end
    end
  end
end
