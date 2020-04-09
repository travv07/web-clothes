class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    # alias_action :update, :edit, to: :modify
    # alias_action :update, :edit, :destroy, to: :ued

    return unless user

    case controller_namespace
    when "admin"
      can :manage, :all if user.admin?
    else
      if user.admin?
        can :manage, :all
      else
        can :manage, :all
      end
    end
  end
end
