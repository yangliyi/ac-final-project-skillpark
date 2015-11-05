class AddFbImageToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :fb_image, :string
  end
end
