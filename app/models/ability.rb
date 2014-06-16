class Ability
  include CanCan::Ability

  def initialize(user)
    
      user ||= User.new
      if user.role_id == 2
        can :manage, [Attempt, Grade, Role, Route, User, Comment, Tag, Post]
      else
        can [:read], [ Post, Attempt, Grade, Route, User, Comment, Tag]
        can [:create], [Attempt, Route, User, Comment, Tag]
        can [:edit, :update], [Attempt, User, Comment, Tag]  # somethig strange is going on here,. :user_id => user.id
      end
  end
end


