class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to @favorite.item, notice: 'アイテムをお気に入りしました。'
    else
      redirect_to @favorite.item, alert: 'アイテムのお気に入りに失敗しました。'
    end
  end
    private
    
    def favorite_params
      params.require(:favorite).permit(:item_id)
    end
end
