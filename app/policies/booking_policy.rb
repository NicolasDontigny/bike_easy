class BookingPolicy < ApplicationPolicy
  def create?
    record.bike.user != user
  end

  def confirm?
    true
  end

  def cancel?
    true
  end

  def destroy?
    record.user == user
  end

  def rentals?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
