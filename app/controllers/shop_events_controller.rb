class ShopEventsController < ApplicationController
  # ...
  
  def new
    @event = Event.new
    @user_items = current_user.items # ユーザーが持っているアイテムを取得
  end

  # ...
end
