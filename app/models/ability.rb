class Ability

  include CanCan::Ability

  def initialize(user)
    if user != nil
      if user.admin?
          can :manage, :all
      else
          can :read, Item
      end
    end
  end

end