class VotePolicy < ApplicationPolicy
  def update?
    record.user == user
  end

end
