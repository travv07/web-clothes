class UsersController < ApplicationController
  authorize_resource

  before_action :load_user, only: [:show, :update_image]

  def show; end

  def update_image
    if @user.update_attributes user_image_params
      flash[:success] = "Updated image user success "
      redirect_to @user
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash["danger"] = "User not found"
    redirect_to root_path
  end

  def user_image_params
    params.require(:user).permit :avatar
  end
end
