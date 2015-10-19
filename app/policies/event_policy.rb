class EventPolicy < ApplicationPolicy
  def index?
    !user.nil?
  end

  def show?
    true
  end

  def create?
    !user.nil?
  end

  def update?
    !user.nil?
  end

  def destroy?
    !user.nil?
  end
end
