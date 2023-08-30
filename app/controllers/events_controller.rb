class EventsController < ApplicationController
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to user_dashboard_path, notice: 'イベントを登録しました。'
    else
      flash.now[:alert] = @event.errors.full_messages.join(', ')
      render :new
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:opened_at, :closed_at, :location_id, :address, :shop_id)
  end
end
