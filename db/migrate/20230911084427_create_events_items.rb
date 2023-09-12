class CreateEventsItems < ActiveRecord::Migration[7.0]
  def change
    create_table :events_items do |t|
      t.references :event, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
