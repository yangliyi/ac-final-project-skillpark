class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.attachment :image
      t.integer :skill_id

      t.timestamps null: false
    end

    add_index :pictures, :skill_id
  end
end
