class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string "lastname", :null => false
      t.string "firstname", :null => false
      t.string "email", :null => true
      t.string "tel_home", :null => true
      t.string "tel_mobil", :null => true
      t.string "adress", :null => true
      t.string "country", :null => false
      t.timestamps
    end
  end
end
