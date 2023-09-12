class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image
      t.references :shop, null: true, foreign_key: true

      t.timestamps
    end
  end
end
