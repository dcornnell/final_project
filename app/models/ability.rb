class Ability
  include CanCan::Ability

  def initialize(user)
    
      user ||= User.new
      if user.admin == "admin"
        can :manage, [Attempt, Grade, Role, Route, User, Session]
      else
        can [:read], [Attempt, Grade, Route, User]
        can [:create], [Attempt, Route, User, Session]
        can [:edit, :update], [Attempt, Route, User, Session], :user_id => user.id
      end
  end
end


