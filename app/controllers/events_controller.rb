class EventsController < ApplicationController
 
  def index
    @events = Event.all
    @event_dates = Event.pluck(:opened_at).uniq # 開催日時の一覧を取得
    
    # フォームから送信された日付範囲を取得
    date_range = params[:date_range]

    # date_rangeが存在する場合のみクエリを実行
    if date_range.present?
      start_date, end_date = date_range.split(' - ')
      @events = Event.where('opened_at >= ? AND opened_at <= ?', Date.parse(start_date), Date.parse(end_date))
    else
      @events = Event.all
    end
    
  end
  
  def show
    @event = Event.find(params[:id])
    @shop = @event.shop # イベントに関連するショップ情報を取得
    @event_items = @event.items # イベントが提供するアイテムのリストを取得
    @shops = Shop.all # すべてのショップを取得
    
  end
  
  def new
    @locations = Location.all
    @shop = Shop.find(params[:shop_id])
    @event = @shop.events.build
    @user_items = current_user.items
    @shops = Shop.all # すべてのショップ情報を取得（任意の場合）
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @event = @shop.events.build(event_params)
    @event.item_ids = params[:event][:item_ids]
    @shops = Shop.all

    if @event.save
      #binding.pry
      redirect_to shop_event_path(@shop, @event), notice: 'イベントが正常に保存されました。'
    else
      #binding.pry
      flash.now[:alert] = @event.errors.full_messages.join(', ')
      render :new
    end
  end
  
  def edit
    @shop = Shop.find(params[:shop_id]) # 必要ならば、店舗を取得
    @event = @shop.events.find(params[:id]) # 店舗内のイベントを取得
    @user_items = current_user.items
    @shops = Shop.all # すべてのショップ情報を取得（任意の場合）
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
  # パラメーターの許可と必要なフィールドの取得
  permitted_params = params.require(:event).permit(:open_date, :open_time, :close_date, :close_time, :location_id, :address, item_ids: [])

  # open_date と open_time を結合して opened_at を生成
  opened_at = "#{permitted_params[:open_date]} #{permitted_params[:open_time]}"
  closed_at = "#{permitted_params[:close_date]} #{permitted_params[:close_time]}"

  # 不要なパラメーターの削除
  permitted_params.delete(:open_date)
  permitted_params.delete(:open_time)
  permitted_params.delete(:close_date)
  permitted_params.delete(:close_time)

  # 修正されたパラメーターを返す
  permitted_params.merge(opened_at: opened_at, closed_at: closed_at)
  end


end
