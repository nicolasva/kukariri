class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.datetime "date_at", :null => false
      t.references :type
      t.timestamps
    end

    add_index :notifications, [:type_id], :name => "index_notifications_on_types", :unique => true
  end
end
