class BidPolicy < ApplicationPolicy
  def create
    record.auction.user != user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
