class UsersController < ApplicationController
  before_action :authenticate_user!
  
    def item_new
      @item = Item.new
      redirect_to user_item_new_user_path(current_user)
    end
    
    def dashboard
    @user = current_user
    @shops = @user.shops
    @items = Item.where(shop_id: @shops.pluck(:id))
    end

  
    def edit
    @user = User.find(params[:id])
    end
    
    def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新が成功した場合の処理
    else
      render 'edit'
    end
  end
end