class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
   
   user ||= User.new # guest user (not logged in)

   if user.admin?
     can :manage, :all
     can :read, :all
   elsif user.project_manager?
     can :manage, [Project, Client, Hour]
     cannot :destroy, :project
     can :read, :all
   elsif user.works_at_eve?
     can :manage, :hours, :user_id => user.id
     can :read, :all
   else
     can :read, :projects, :client_id => user.client_id
     cannot :read, :hours
   end   
   
   
   

   
   

    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
