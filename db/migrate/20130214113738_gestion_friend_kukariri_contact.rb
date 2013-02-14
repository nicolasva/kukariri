class GestionFriendKukaririContact < ActiveRecord::Migration
  def up
    create_table :friends do |t|
      t.boolean "follow", :default => false
      t.boolean "friend", :default => false
      t.references :user
    end

    add_index :friends, [:user_id], :name => "index_user_on_friends", :unique => false

    create_table :friend_users do |t|
      t.references :user
      t.references :friend
    end

    add_index :friend_users, [:user_id], :name => "index_users_on_friend_users", :unique => false
    add_index :friend_users, [:friend_id], :name => "index_friend_on_friend_users", :unique => false
  end
end
