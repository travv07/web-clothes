class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    alias_action :show, :update, :update_image, :edit, to: :modify
    # alias_action :update, :edit, :destroy, to: :ued

    return unless user

    case controller_namespace
    when "admin"
      can :manage, :all if user.admin?
    else
      if user.admin?
        can :manage, :all
        can :manage, User
      else
        can :modify, User, id: user.id
      end
    end
  end
end
