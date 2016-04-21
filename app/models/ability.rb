class Ability
  include CanCan::Ability
  # CanCanCan auotmatically integrates iwth ApplicationController and it assumes
  # that you have a method in your ApplicationController called 'current_user'
  # you don't need to automatically cr4atye an Ability object (Automatically done)
  # we just need to learn how to write authorization rule and how to use them

  def initialize(user)

    # we instantiate the user to user.new to avoid have user be nil if the user
    # is not signed in,. we assume here that 'user' will be User.new if the
    # user is not signed in
    user ||= User.new # guest user (not logged in)

    # this gives superpowers to the admin users by having the ability to manager
    # evreything (all actions on all models)
    can :manage, :all if user.admin?

    alias_action :create, :read, :update, :destroy, :to => :crud

    can :crud, Question do |q|
      q.user == user && user.persisted?
    end

    can :destroy, Answer do |a|
      (a.question.user == user || a.user == user) && user.persisted?
    end
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
