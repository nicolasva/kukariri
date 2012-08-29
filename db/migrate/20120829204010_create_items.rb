class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string "title", :null => false
      t.references :user 
      t.timestamps
    end

    add_index :items, [:user_id], :name => "index_users_on_items", :unique => true
  end
end
