class AddPaperclipToCategory < ActiveRecord::Migration
  def change
    add_attachment :categories, :category_icon
  end
end
