# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    %i(sign_up account_update).each do |type|
      devise_parameter_sanitizer.permit(
        type, keys: [:email, :name, :password, :password_confirmation]
      )
    end
  end
end
