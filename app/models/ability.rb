class Ability
  include CanCan::Ability

  def initialize(user)
    
      user ||= User.new
     
      if user.role_id == 1
        can :manage, :all
      else
        can [:read], [Location, Post, Attempt, Grade, Route, User, Comment, Tag]
        can [:create], [Attempt, Route, User, Comment, Tag]
        can [:edit, :update], [Attempt, User, Comment, Tag]  
      end
  end
end


