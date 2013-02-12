class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.new_record?
      can :read, :all
    else
      can :manage, :all
    end
  end
  
end
