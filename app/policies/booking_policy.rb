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

  def rentals?
    true
  end

  def destroy?
    # only the owner of the bike_id can delete the booking
    # Not the booking user
    record.user != user
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
