class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)
  before_action :set_auction, only: %i(new create)
  before_action :set_user, only: %i(index)
  before_action :correct_user, only: %i(new create)
  before_action :new_review, only: %i(new create)

  def index
    @reviews = @user.reviews.page(params[:page]).includes(:reviewer, auction: :product)
  end

  def new
    @review = @auction.build_review(reviewer: current_user)
  end

  def create
    @review = @auction.build_review(review_params)
    @review.reviewer = current_user

    if @review.save
      redirect_to @auction, notice: '評価を投稿しました。'
    else
      render :new
    end
  end

  private

    def set_auction
      @auction = Auction.find(params[:auction_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def correct_user
      raise Forbidden if @auction.successful_bidder != current_user
    end

    def new_review
      raise Forbidden unless @auction.review.nil?
    end
end
