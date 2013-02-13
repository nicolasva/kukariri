class RenameColumnRegionsToContacts < ActiveRecord::Migration
  def up
    rename_column(:contacts, :regions, :region)
  end
end
