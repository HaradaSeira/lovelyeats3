class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.references :shop, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :address
      t.timestamps
    end
  end
end