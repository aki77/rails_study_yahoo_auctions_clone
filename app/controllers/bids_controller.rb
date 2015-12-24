class BidsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)
  before_action :set_auction
  before_action :correct_auction, only: %i(new create)

  def index
    @bids = @auction.bids.page(params[:page]).includes(:user)
  end

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

    def correct_auction
      redirect_to @auction, alert: 'このオークションは終了しています。' if @auction.closed?
    end
end
