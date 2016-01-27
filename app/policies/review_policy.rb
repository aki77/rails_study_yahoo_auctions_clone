class ReviewPolicy < ApplicationPolicy
  def create?
    record.auction.successful_bidder == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
