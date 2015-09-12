class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can [:manage], User
      can [:manage], Hero
    end
  end
end
