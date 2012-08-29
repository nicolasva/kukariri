class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.datetime "date_at"
      t.references :type
      t.timestamps
    end

    add_index :notifications, [:type_id], :name => "index_types_on_notifications", :unique => true
  end
end
