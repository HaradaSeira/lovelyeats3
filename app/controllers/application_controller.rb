class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    "<ログイン後に遷移させたいページ>"
  end
end
