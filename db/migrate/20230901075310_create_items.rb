class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
