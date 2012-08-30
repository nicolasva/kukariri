class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.datetime "date_at"
      t.datetime "date_to"
      t.text "descriptif"
      t.references :item
      t.timestamps
    end

    add_index :types, [:item_id], :name => "index_types_on_items", :unique => true
  end
end
