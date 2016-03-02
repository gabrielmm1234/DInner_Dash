class Ability

  include CanCan::Ability

  def initialize(user)
    if user != nil
      if user.admin?
          can :manage, :all
      else
          can :read, Item
          can :manage,OrderItem
          can :read,Order,:user_id => user.id
          can :create,Order
          can :update,Order
      end
    end
  end

end