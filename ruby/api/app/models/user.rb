class User < ApplicationRecord
  def admin?
    role == "admin"
  end

  def user?
    role == "user" or admin?
  end

  def guest?
    true
  end
end
