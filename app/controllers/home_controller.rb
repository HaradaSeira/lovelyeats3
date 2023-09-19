class HomeController < ApplicationController
  require 'user'
  
  def index
    # すべてのおみせを取得
   @shops = Shop.all
    if current_user && current_user.has_role?(:vendor)
      # ログインユーザーがベンダーの場合は dashboard を表示
      render 'users/dashboard' # home/index.html.erbを表示
    else
      # 一般ユーザーまたは未ログインの場合は home/index を表示
      render 'home/index'
    end
      
    # 検索条件に合致するイベントを取得
    if params[:location].blank? && params[:start_date].blank? && params[:end_date].blank?
      @events = Event.all
    else
      @events = filter_events(params[:location], params[:start_date], params[:end_date])
    end

    @locations = Location.all
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
    if start_date.present?
      events = events.where('start_date >= ?', start_date)
    end
    if end_date.present?
      events = events.where('end_date <= ?', end_date)
    end

    events # 絞り込んだイベントを返す
  end
end
