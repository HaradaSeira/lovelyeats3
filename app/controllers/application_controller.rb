class ApplicationController < ActionController::Base
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:custom_field])
    end
  
    def after_sign_in_path_for(resource)
      if resource.is_a?(User) && !resource.admin?
        # 出店者の場合はダッシュボードページにリダイレクト
        user_dashboard_path(resource)
      else
        # 管理者ユーザーの場合はデフォルトのパスにリダイレクト
        super
      end
    end
  end