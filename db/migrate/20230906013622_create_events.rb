class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :opened_at
      t.datetime :closed_at
      t.integer :shop_id
      t.integer :location_id
      t.string :address
      t.timestamps
    end
  end
end
