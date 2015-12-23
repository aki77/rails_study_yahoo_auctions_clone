class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_auction

  def new
    @bid = @auction.bids.build(user: current_user)
  end

  def create
    @bid = @auction.bids.build(bid_params)
    @bid.user = current_user

    if @bid.save
      redirect_to @auction, notice: '入札しました。'
    else
      render :new
    end
  end

  private

    def set_auction
      @auction = Auction.find(params[:auction_id])
    end

    def bid_params
      params.require(:bid).permit(:value)
    end
end
