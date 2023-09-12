class CreateItemShopJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :item_shop do |t|
      t.references :item, foreign_key: true
      t.references :shop, foreign_key: true
    end
  end
end
