class GardenPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    is_owner_or_admin?
  end

  def destroy?
    is_owner_or_admin?
  end

  private

  def is_owner_or_admin?
    record.user == user
  end
end
