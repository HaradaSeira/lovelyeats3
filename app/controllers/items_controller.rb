class ItemsController < ApplicationController
  before_action :set_shop
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @shop.items.all
  end

  def show
  end

  def new
    @item = @shop.items.new
  end

  def create
    @item = @shop.items.new(item_params)

    if @item.save
      redirect_to shop_item_path(@shop, @item), notice: '新メニューが作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to shop_item_path(@shop, @item), notice: 'メニューが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to shop_items_path(@shop), notice: 'メニューが削除されました。'
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_item
    @item = @shop.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :image)
  end
end
