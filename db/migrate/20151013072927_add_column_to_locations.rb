class AddColumnToLocations < ActiveRecord::Migration

  def change
    add_column :profiles, :location_id, :integer
    add_index :profiles, :location_id
  end
end
