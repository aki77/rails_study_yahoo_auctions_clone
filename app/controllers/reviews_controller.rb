class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)
  before_action :set_auction, only: %i(new create)
  before_action :set_user, only: %i(index)
  before_action :first_review, only: %i(new create)

  def index
    @reviews = @user.reviews.page(params[:page]).includes(:reviewer, auction: :product)
  end

  def new
    @review = @auction.build_review(reviewer: current_user)
    authorize @review
  end

  def create
    @review = @auction.build_review(review_params)
    @review.reviewer = current_user
    authorize @review

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

    def first_review
      if @auction.review.present?
        redirect_to @auction, alert: '既にレビューを投稿済みです'
      end
    end
end
