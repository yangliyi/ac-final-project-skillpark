class CreateProfileCategoryships < ActiveRecord::Migration
  def change
    create_table :profile_categoryships do |t|
      t.integer :profile_id
      t.integer :category_id

      t.timestamps null: false
    end

    add_index :profile_categoryships, :profile_id
    add_index :profile_categoryships, :category_id
  end
end
