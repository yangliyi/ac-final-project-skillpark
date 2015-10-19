class CreateUserProfileFavoriteships < ActiveRecord::Migration
  def change
    create_table :user_profile_favoriteships do |t|
      t.integer :user_id
      t.integer :profile_id

      t.timestamps null: false
    end

    add_column :profiles, :favorited_users_count, :integer, default: 0

    add_index :user_profile_favoriteships, :user_id
    add_index :user_profile_favoriteships, :profile_id
  end
end
