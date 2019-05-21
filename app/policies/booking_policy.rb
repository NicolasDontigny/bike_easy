class BookingPolicy < ApplicationPolicy
  def create?
    record.bike.user != user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
