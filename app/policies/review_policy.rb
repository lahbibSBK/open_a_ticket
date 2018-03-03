class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
  	record.ticket.alumni == user
  end

  def create?
  	new?
  end
end
