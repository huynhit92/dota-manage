class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can [:manage], User
      can [:manage], Hero
      can [:manage], Divide
      can [:manage], Item
    end
  end
end
