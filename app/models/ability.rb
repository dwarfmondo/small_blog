class Ability
  include CanCan::Ability

  def initialize(user)
    can [:update, :destroy], User, id: user.id
    can [:update, :destroy], Blog, user_id: user.id
  end
end
