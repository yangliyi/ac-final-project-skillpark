class AddPhotoToProfiles < ActiveRecord::Migration

  def change
    add_attachment :profiles, :photo
  end

  add_index :profiles, :user_id
end
