class EventsController < ApplicationController
  def new
    @event = Event.new
    @locations = Location.all 
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
    params.require(:event).permit(
    :event_date,
    :start_time,
    :end_time,
    :location_id,
    :address,
    :shop_id
  )
  end
end
