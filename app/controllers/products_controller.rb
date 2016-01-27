class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i(show edit update destroy)

  def index
    @products = current_user.products.page(params[:page]).order(id: :desc)
  end

  def show
  end

  def new
    @product = current_user.products.build
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      redirect_to @product, notice: '商品を登録しました。'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: '商品を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy!
    redirect_to products_url, notice: '商品を削除しました。'
  end

  private

    def set_product
      @product = current_user.products.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description)
    end
end
