class BikePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
