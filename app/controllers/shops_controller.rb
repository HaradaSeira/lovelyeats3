class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end
  
  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      redirect_to user_dashboard_path, notice: 'おみせを登録しました。'
    else
      render :new
    end
  end
  
  def show
    @shop = Shop.find(params[:id])
    @events = @shop.events # イベント一覧を取得
  end
  
  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop), notice: 'おみせの情報が更新されました。'
    else
      render :edit
    end
  end
  
  def destroy 
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to user_dashboard_path, notice: 'おみせを削除しました。', status: :see_other
  end
  
  private

  def shop_params
    params.require(:shop).permit(:name, :description, :image)
  end
  
end