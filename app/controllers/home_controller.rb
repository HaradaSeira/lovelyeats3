class HomeController < ApplicationController
  def index
    @locations = Location.all # 仮に Location モデルからデータを取得していると仮定
  end
end