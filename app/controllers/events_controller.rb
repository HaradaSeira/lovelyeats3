class EventsController < ApplicationController
 
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
    @shop = @event.shop # イベントに関連するショップ情報を取得
    @event_items = @event.items # イベントが提供するアイテムのリストを取得
  end
  
  def new
    @shop = Shop.find(params[:shop_id])
    @event = @shop.events.build
    @locations = Location.all
    @user_items = current_user.items
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @event = @shop.events.build(event_params)
    @event.item_ids = params[:event][:item_ids]

    if @event.save
      redirect_to shop_events_path(@shop, @event), notice: 'イベントが正常に保存されました。'
    else
      flash.now[:alert] = @event.errors.full_messages.join(', ')
      render :new
    end
  end
  
  def edit
    @shop = Shop.find(params[:shop_id]) # 必要ならば、店舗を取得
    @event = @shop.events.find(params[:id]) # 店舗内のイベントを取得
    @user_items = current_user.items
  end

  def update
    @shop = Shop.find(params[:shop_id]) # 必要ならば、店舗を取得
    @event = @shop.events.find(params[:id]) # 店舗内のイベントを取得
  
    if @event.update(event_params)
      redirect_to shop_event_path(@shop, @event), notice: 'イベントが正常に更新されました。'
    else
      flash.now[:alert] = @event.errors.full_messages.join(', ')
      render :edit
    end
  end


  private

  def event_params
    params.require(:event).permit(:opened_at, :closed_at, :location_id, :address, item_ids: [])
  end
end
