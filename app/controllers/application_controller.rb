class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception

  def current_ability
    controller_name_segments = params[:controller].split("/")
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join("/").camelize
    @current_ability ||= Ability.new(current_user, controller_namespace)
  end

  rescue_from CanCan::AccessDenied do |_exception|
    if user_signed_in?
      flash[:warning] = "You can not access this page"
      redirect_to root_url
    else
      flash[:warning] = "You need log in before to this page"
      redirect_to new_user_session_path
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_products_path()
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :email, :password, :password_confirmation, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :email, :phone_number])
  end
end
