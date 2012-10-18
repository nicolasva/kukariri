class AddColumnPicturesMaster < ActiveRecord::Migration
  def up
    add_column :pictures, :master, :boolean, :default => 0, :null => false
  end
end
