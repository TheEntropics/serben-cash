class AdminPolicy < ApplicationPolicy
  def index?
    is_admin?
  end
end
