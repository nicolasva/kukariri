class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string "lastname", :null => false
      t.string "firstname", :null => false
      t.string "email", :null => true
      t.string "tel_home", :null => true
      t.string "tel_mobil", :null => true
      t.string "adress", :null => true
      t.references :state
      t.timestamps
    end

    add_index :contacts, [:state_id], :name => "index_states_on_contacts", :unique => true
  end
end
