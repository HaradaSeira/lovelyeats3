class UsersController < ApplicationController
  def dashboard
    if current_user
      # @locations 変数にデータをセットするクエリを実行する
      @locations = Location.all # 例: Location モデルからすべての場所を取得する
      @shops = Shop.where(user_id: current_user.id) # ユーザーに関連するショップを取得する
      @items = Item.where(user_id: current_user.id) # ユーザーに関連するメニューを取得する
    else
      redirect_to user_session_path, alert: 'ログインしてください'
    end
  end
end
