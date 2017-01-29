# frozen_string_literal: true
class ImagesController < ApplicationController
  before_action :load_user
  responders :flash

  def create
    @image = @user.images.create(create_params)
    respond_with @image, location: -> { user_path(@user) }
  end

  def destroy
    @image = @user.images.find(params[:id]).delete
    respond_with @image, location: -> { user_path(@user) }
  end

  def new
    @image = @user.images.build
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def create_params
    params.require(:image).permit(:content)
  end
end
