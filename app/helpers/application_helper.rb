module ApplicationHelper

  def has_access
    if current_user
      return true
    elsif current_user.is_admin?
    end
  end

  def is_super_user
    current_user.is_admin?
  end

end
