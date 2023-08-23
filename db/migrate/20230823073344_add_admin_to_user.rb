class AddAdminToUser < ActiveRecord::Migration[7.0]
  def change
    # default: falseを追加
    add_column :users, :admin, :boolean, default: false
  end
end
