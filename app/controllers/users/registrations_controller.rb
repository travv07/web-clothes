# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController


  protected


  def after_sign_up_path_for(resource)
    redirect_to root_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
