class RenameTableFriendUsers < ActiveRecord::Migration
  def up
    rename_table(:friend_users, :friends_users)
  end
end
