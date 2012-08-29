class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.datetime "date_at"
      t.datetime "date_to"
      t.text "descriptif"
      t.boolean "status", :null => false, :default => false
      t.references :item
      t.timestamps
    end

    add_index :types, [:item_id], :name => "index_items_on_types", :unique => true
  end
end
