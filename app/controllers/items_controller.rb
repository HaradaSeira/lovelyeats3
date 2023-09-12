class ItemsController < ApplicationController
  before_action :authenticate_user! # ログイン済みのユーザーだけがアクセスできるようにする

  def index
    @user = current_user
    @items = @user.items
  end

  def show
    @item = current_user.items.find(params[:id])
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    @item.shop_id = params[:item][:shop_id] # shop_id を設定
    
    if @item.save
      redirect_to items_path(@item), notice: 'アイテムが作成されました。'
    else
      render :new
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'アイテムが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: 'アイテムが削除されました。'
  end
  
  private

  def item_params
   params.require(:item).permit(:name, :description, :price, :image) # アイテムの属性に合わせて変更
  end

end