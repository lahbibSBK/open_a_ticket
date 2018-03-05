class MentorProfilPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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
    true
  end

  def edit?
  	record.user == user
  end
end
