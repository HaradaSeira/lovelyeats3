class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def dashboard
    @user = current_user
    @shops = @user.shops
    # ここで一般ユーザー用のダッシュボードの表示処理を記述
    # 例えば、一般ユーザー用の情報やデータを取得して表示するコードを追加
  end
  
    def edit
    @user = User.find(params[:id])
    end
    
    def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新が成功した場合の処理
    else
      render 'edit'
    end
  end
end