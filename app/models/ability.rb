class Ability
  include CanCan::Ability

  def initialize(user)
    
      user ||= User.new
      if user.role_id == 1
        can :manage, [Attempt, Grade, Role, Route, User, Comment]
      else
        can [:read], [Attempt, Grade, Route, User, Comment]
        can [:create], [Attempt, Route, User, Comment]
        can [:edit, :update], [Attempt, Route, User, Comment], :user_id => user.id
      end
  end
end


