class EventsController < ApplicationController
  def show
    @shop = Shop.find(params[:shop_id])
    @event = @shop.events.find(params[:id])
  end

  def new
    @event = Event.new
    @locations = Location.all
  end

  def create
    Rails.logger.debug(params.inspect)
    @event = Event.new(event_params)

    if @event.valid?
      # ここでデバッグ出力
      puts "opened_atの値: #{@event.opened_at}"
      @event.save # データベースに保存
      redirect_to user_dashboard_path, notice: 'イベントを登録しました。'
    else
      flash.now[:alert] = @event.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :location_id,
      :address,
      :shop_id,
      :opened_at,
      :closed_at 
    )
  end
end
