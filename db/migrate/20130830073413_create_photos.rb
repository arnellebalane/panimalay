class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.string :filename
      t.text :caption, :default => ""
      t.references :user, :null => false
      t.timestamps
    end
    add_index :photos, :user_id
  end

  def down
    drop_table :photos
  end
end
