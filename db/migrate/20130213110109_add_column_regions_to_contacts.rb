class AddColumnRegionsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :regions, :string
  end
end
