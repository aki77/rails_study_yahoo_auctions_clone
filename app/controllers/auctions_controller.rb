class AuctionsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create destroy)
  before_action :set_product, only: %i(new create)
  before_action :set_auction, only: %i(show destroy)

  def index
    @auctions = Auction.open.page(params[:page]).includes(:product)
  end

  def closed
    @auctions = Auction.closed.page(params[:page]).includes(:product)
    render :index
  end

  def show
  end

  def new
    @auction = @product.auctions.build
  end

  def create
    @auction = @product.auctions.build(auction_params)

    if @auction.save
      redirect_to @auction, notice: '商品を出品しました。'
    else
      render :new
    end
  end

  def destroy
    @auction.destroy!
    redirect_to auctions_url, notice: '出品を取り消しました。'
  end

  private

    def set_product
      @product = current_user.products.find(params[:product_id])
    end

    def set_auction
      @auction = Auction.find(params[:id])
    end

    def auction_params
      params.require(:auction).permit(:value, :expired_at)
    end
end
