class AddEventReferenceToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :event, null: true, foreign_key: true
  end
end
