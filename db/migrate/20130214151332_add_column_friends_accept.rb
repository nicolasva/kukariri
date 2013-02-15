class AddColumnFriendsAccept < ActiveRecord::Migration
  def up
    add_column :friends, :accept_friend, :boolean, :default => false
  end
end
