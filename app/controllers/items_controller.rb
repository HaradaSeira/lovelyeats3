class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @items = @user.items.all
  end

  def show
  end

  def new
    @item = @user.items.new
  end

  def create
    @item = @user.items.new(item_params)

    if @item.save
      redirect_to user_item_path(@user, @item), notice: '新メニューが作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to user_item_path(@user, @item), notice: 'メニューが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to user_items_path(@user), notice: 'メニューが削除されました。'
  end

  
end
