class BikePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
<<<<<<< HEAD

  def edit?
    record.user == user
  end

=======
  
  def edit?
    record.user == user
  end
  
>>>>>>> b3b6ff3c9efa705895ae652a4379685192c668cc
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
