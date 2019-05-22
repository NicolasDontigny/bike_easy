class BikePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def edit?
    user_owner?
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    user_owner?
  end

  def destroy?
    user_owner?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user).order('created_at DESC')
    end
  end

  private

  def user_owner?
    record.user == user
  end
end
