class EventsController < ApplicationController
  def new
    @shop = Shop.find(params[:shop_id])
    @event = @shop.events.build
    @locations = Location.all
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @event = @shop.events.build(event_params)

    if @event.save
      redirect_to shop_events_path(@event), notice: 'イベントが正常に保存されました。'
    else
      flash.now[:alert] = @event.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :opened_at,
      :closed_at,
      :location_id,
      :address
    )
  end
end
