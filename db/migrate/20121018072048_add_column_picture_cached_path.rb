class AddColumnPictureCachedPath < ActiveRecord::Migration
  def up
    add_column :pictures, :picture_cached_path, :string
  end
end
