class HomeController < ApplicationController
  require 'user'
  
  def index
    @locations = Location.all
    @event_dates = Event.pluck(:opened_at).uniq
  
      # 検索条件に合致するイベントを取得
    if params[:location].blank? && params[:start_date].blank? && params[:end_date].blank?
      @events = Event.where('closed_at >= ?', Time.now)  # 終了していないイベントを表示
    else
      @events = filter_events(params[:location], params[:start_date], params[:end_date])
                      .where('closed_at >= ?', Time.now)  # 終了していないイベントを表示
    end
  
    # 特定のイベントを表示したい場合（例: 1番目のイベントを表示）
    @event = @events.first
  
    @shops = Shop.all
    @items = Item.all
  
    if current_user
      if current_user.has_role?(:vendor)
        # ベンダーの場合
        puts "Rendering users/dashboard"
        render 'users/dashboard'
      else
        # 一般ユーザーの場合
        puts "Rendering home/index"
        render 'home/index'
      end
    else
      # 未ログインの場合
      puts "Rendering home/index (guest)"
      render 'home/index'
    end
  end


  def search_by_location
      @locations = Location.all
      
    if params[:location].present?
      location = Location.find(params[:location])
      @events = location.events
      @event_dates = @events.pluck(:opened_at).uniq
      @event = @events.first # この行を追加することで@eventを設定
    else
      @events = Event.all
      @event_dates = @events.pluck(:opened_at).uniq
    end
  
    render 'home/index'
  end
  
  private

  def filter_events(location, start_date, end_date)
    # 検索条件に基づいてイベントを絞り込むロジックを実装
    events = Event.all # すべてのイベントを取得
  
    # ロケーションで絞り込み
    if location.present?
      events = events.where(location_id: location)
    end
  
    # 開始日と終了日で絞り込み
    if opened_at.present?
      events = events.where('opened_at >= ?', start_date)
    end
    if closed_at.present?
      events = events.where('closed_at <= ?', end_date)
    end
  
    # イベントから日付情報を取得して @event_dates に格納
    @event_dates = events.pluck(:opened_at).uniq
  
    events # 絞り込んだイベントを返す
  end


end
