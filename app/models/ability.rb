class Ability
  include CanCan::Ability

 
  def initialize(user)
    user ||= User.new # guest user

    # if a member, they can manage their own albums 
    # (or create new ones)
    if user.role? :member
      can :manage, Album, :user_id => user.id
      can :manage, Source, :user_id => user.id
    end

    # Moderators can delete any post
    if user.role? :premium_member
      can :destroy, Album, :user_id => user.id
      can :destroy, Source, :user_id => user.id
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, :all
  end

end
