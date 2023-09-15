# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  layout 'admin'

  def new
    super
  end

  # POST /resource/sign_in
  # 例：セッションの開始とリダイレクト
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    respond_with resource, location: after_sign_in_path_for(resource)
  end


  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # サインアウト後のリダイレクト先を指定
  def after_sign_out_path_for(resource)
    rails_admin_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
