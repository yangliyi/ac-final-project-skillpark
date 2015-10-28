class RemoveColumnFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :administrationarea
  end
end
