class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.guest?
      can [:show, :index], :all
    end
    if user.admin?
      can [:update, :destroy, :create], :all
    elsif user.user?
      can :create, :all
      can [:update, :destroy], Author do |author|
        author.creator == user
      end
      can [:update, :destroy], Book do |book|
        book.creator == user
      end
    end
  end
end
