class CreateProvidedDates < ActiveRecord::Migration
  def change
    create_table :provided_dates do |t|
      t.datetime :date_at
      t.datetime :date_to
      t.references :contact
      t.references :item
      t.timestamps
    end

    add_index :provided_dates, [:contact_id], :name => "index_provided_dated_on_contacts"
    add_index :provided_dates, [:item_id], :name => "index_provided_dated_on_items"
    remove_column :types, :date_at
    remove_column :types, :date_to
  end
end
