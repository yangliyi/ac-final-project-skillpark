class AddColumnToProfile < ActiveRecord::Migration

  def change
    add_column :profiles, :user_id, :integer
  end

end
