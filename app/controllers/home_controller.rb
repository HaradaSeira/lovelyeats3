class HomeController < ApplicationController
  require 'user'
  
  def index
    @locations = Location.all
    @event_dates = Event.pluck(:opened_at).uniq

    # 検索条件に合致するイベントを取得
    if params[:location].blank? && params[:start_date].blank? && params[:end_date].blank?
      @events = Event.all
    else
      @events = filter_events(params[:location], params[:start_date], params[:end_date])
    end
    
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
    location_id = params[:location]
    @events = Event.where(location_id: location_id)
    @locations = Location.all
    @shops = Shop.all # ショップ情報も必要かつ値を持たせる
    render 'home/index'
  end

  private

  def filter_events(location, start_date, end_date)
    # 検索条件に基づいてイベントを絞り込むロジックを実装
    events = Event.all # すべてのイベントを取得
  
    # ロケーションで絞り込み
    if location.present?
      events = events.where(location: location)
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
