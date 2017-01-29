# frozen_string_literal: true
class ImagesController < ApplicationController
  before_action :load_user

  def create
    @image = @user.images.create(create_params)
    if @image.persisted?
      flash[:notice] = 'Image successfully created'
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    @user.images.find(params[:id]).delete
    flash[:notice] = 'Image successfully deleted'
    redirect_to user_path(@user)
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
