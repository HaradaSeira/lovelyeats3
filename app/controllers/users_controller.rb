class UsersController < ApplicationController
  def dashboard
    if current_user
      if current_user.has_role?(:vendor)
        # ベンダーの場合は user_dashboard ビューを表示
        @locations = Location.all
        @shops = Shop.where(user_id: current_user.id)
        @items = Item.where(user_id: current_user.id)
        render 'users/dashboard'
      else
        # 一般ユーザーの場合は home/index ビューを表示
        redirect_to root_path
      end
    else
      redirect_to user_session_path, alert: 'ログインしてください'
    end
  end

  def profile
    if current_user
      @user = current_user # ログインしているユーザーを@userに設定する
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_profile_path, notice: 'プロフィールが更新されました'
    else
      render 'profile'
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :email, :image)
  end
end
