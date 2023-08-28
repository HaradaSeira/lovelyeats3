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
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :description, :image)
  end
  
end
