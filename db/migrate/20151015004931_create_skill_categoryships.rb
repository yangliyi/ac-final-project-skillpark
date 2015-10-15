class CreateSkillCategoryships < ActiveRecord::Migration
  def change
    create_table :skill_categoryships do |t|
      t.integer :skill_id
      t.integer :category_id

      t.timestamps null: false
    end

    add_index :skill_categoryships, :skill_id
    add_index :skill_categoryships, :category_id

  end
end
