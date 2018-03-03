class MentorProfilPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end


  def index?
  	true
  end

  def new?
    true
  end

  def create?
    new?
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def show?
    edit?
  end

  def edit?
  	record.user == user
  end
end
