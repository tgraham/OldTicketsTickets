class Ability
  include CanCan::Ability
  
  def initialize(user)
    alias_action :show, :to => :view
    
    user ||= User.new #for non-logged in visitors
    
    if user.is_admin?
      can :manage, :all
    else
      if user.is_user?
        can [:view, :edit, :update], User do |current_user|
          user.id == current_user.id || user.is_admin?
        end
        can :create, Ticket
        can [:view, :dashboard], Ticket do |current_user|
          user.id == current_user.id || user.is_admin?
        end
        can [:create, :view], Reply
        can :view, Asset do |current_user|
          user.company.id == current_user.company.id || user.is_admin?
        end
      end
    end
  end
end