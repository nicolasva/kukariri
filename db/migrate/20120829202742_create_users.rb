class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "login", :null => false
      t.string "encrypted_password", :limit => 128, :default => "", :null => false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", :default => 0 
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string "current_sign_in_ip"
      t.string "last_sign_in_ip"
      t.string "email", :null => true, :default => "email@server.com"
      t.timestamps
    end
  end
end
