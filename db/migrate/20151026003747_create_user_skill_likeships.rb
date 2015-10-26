class CreateUserSkillLikeships < ActiveRecord::Migration
  def change
    create_table :user_skill_likeships do |t|
      t.integer :user_id
      t.integer :skill_id

      t.timestamps null: false
    end

    add_column :skills, :liked_users_count, :integer, default: 0

    add_index :user_skill_likeships, :user_id
    add_index :user_skill_likeships, :skill_id

  end
end
