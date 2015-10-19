class UserPolicy < AdminBasePolicy
  def new_role?
    update?
  end

  def destroy_role?
    update?
  end
end
