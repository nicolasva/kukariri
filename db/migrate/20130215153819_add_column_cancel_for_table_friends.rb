class AddColumnCancelForTableFriends < ActiveRecord::Migration
  def up
    add_column(:friends, :cancel, :boolean, :default => false, :null => false)
  end
end
