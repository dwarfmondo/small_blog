class Ability
  include CanCan::Ability

  def initialize(user)
    unless user.nil?
      can [:update, :destroy], User, id: user.id
      can [:update, :destroy], Blog, user_id: user.id

      can :manage, Post do |post|
        post && post.blog.user.id == user.id
      end
    end
  end
end
