class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t| 
      t.string "picture"
      t.string "cached_path"
      t.boolean "master", :null => false
      t.references :item
      t.references :type
      t.timestamps
    end

    add_index :pictures, [:item_id], :name => "index_items_on_pictures", :unique => true
    add_index :pictures, [:type_id], :name => "index_types_on_pictures", :unique => true
  end
end
