class CreatePubliccomments < ActiveRecord::Migration
  def change
    create_table :publiccomments do |t|
      t.text :content
      t.integer  :profile_id
      t.integer  :user_id

      t.timestamps null: false
    end

    add_index :publiccomments, :profile_id
    add_index :publiccomments, :user_id
  end
end
