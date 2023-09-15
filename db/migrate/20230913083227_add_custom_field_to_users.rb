class AddCustomFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :custom_field, :string
  end
end
