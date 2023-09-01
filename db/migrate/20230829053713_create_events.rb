class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :opened_at
      t.datetime :closed_at
      t.references :shop, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end