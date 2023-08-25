class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def dashboard
    @user = current_user
    @shops = @user.shops
    # ここで一般ユーザー用のダッシュボードの表示処理を記述
    # 例えば、一般ユーザー用の情報やデータを取得して表示するコードを追加
  end
end
