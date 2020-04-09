class ApplicationController < ActionController::Base
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
end
