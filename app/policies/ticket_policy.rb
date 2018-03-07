class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(alumni: user)
    end
  end

  def assign_mentor?
    record.alumni == user
  end

  def index?
  	#n'afficher que si tout les @tickets.alumni = user
    true
  end

  def show?
    record.alumni == user
  end

  def new?
    true
  end

  def edit?
    record.alumni == user
  end

  def create?
    true
  end

  def update?
    record.alumni == user
    # - record: the ticket passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.alumni == user
  end

  def close?
    true
  end

  def mentor?
    update?
  end
end
