class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resources)
    if resource.is_a?(User) && !resource.admin?
      # 出店者の場合はダッシュボードページにリダイレクト
      user_dashboard_path
    else
     # 管理者ユーザーの場合はデフォルトのパスにリダイレクト
      super
    end
  end
end