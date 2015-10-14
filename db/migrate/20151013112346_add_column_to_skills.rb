class AddColumnToSkills < ActiveRecord::Migration

  def change

    add_column :skills, :user_id, :integer
    add_index :skills, :user_id
  end

end
