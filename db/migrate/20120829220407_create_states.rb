class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string   "name",       :null => false
      t.integer  "country_id"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.timestamps
    end

    add_index :states, [:country_id], :name => "index_countries_on_states"
  end
end
