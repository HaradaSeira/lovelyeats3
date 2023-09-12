class EventsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @event = @shop.events.build # ショップに関連付けたイベントを新しく生成
    @locations = Location.all
  end

  def create
    @event = Event.new(event_params)
    combine_date_and_time(params[:event], :opened_date, :opened_time, :opened_at)
    combine_date_and_time(params[:event], :closed_date, :closed_time, :closed_at)

    if @event.valid?
      @event.save
      redirect_to user_dashboard_path, notice: 'イベントを登録しました。'
    else
      flash.now[:alert] = @event.errors.full_messages.join(', ')
      render :new
    end
  end

  # 結合用のユーティリティメソッド
  def combine_date_and_time(params, date_attr, time_attr, datetime_attr)
    date = params[date_attr]
    time = params[time_attr]
    return if date.blank? || time.blank?

    datetime_str = "#{date} #{time}"
    params[datetime_attr] = DateTime.parse(datetime_str)
  end

  private

  def event_params
    params.require(:event).permit(
      :location_id,
      :address,
      :shop_id,
      :opened_date,
      :opened_time,
      :closed_date,
      :closed_time
    )
  end
end
