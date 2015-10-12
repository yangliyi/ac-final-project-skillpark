class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.text :description

      t.timestamps null: false
    end
  end
end
