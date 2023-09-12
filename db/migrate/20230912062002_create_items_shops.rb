class CreateItemsShops < ActiveRecord::Migration[7.0]
  def change
    create_table :items_shops do |t|
      t.references :item, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
