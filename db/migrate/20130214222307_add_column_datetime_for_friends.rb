class AddColumnDatetimeForFriends < ActiveRecord::Migration
  def up
    add_column :friends, :created_at, :datetime, :default => "", :null => false
    add_column :friends, :updated_at, :datetime, :default => "", :null => false
  end
end
