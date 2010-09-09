class Ability
  include CanCan::Ability
  
  def initialize(user)
    alias_action :show, :to => :view
    
    user ||= User.new #for non-logged in visitors
    
    if user.role == "admin"
      can :manage, :all
    else
      if user.role == "user"
        can [:view, :edit, :update], User do |current_user|
          user.id == current_user.id || user.role == "admin"
        end
        can :create, Ticket
        can [:view, :dashboard], Ticket do |current_user|
          user.id == current_user.id || user.role == "admin"
        end
        can [:create, :view], Reply
      end
    end
  end
end