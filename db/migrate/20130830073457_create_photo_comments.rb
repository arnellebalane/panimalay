class CreatePhotoComments < ActiveRecord::Migration
  def up
    create_table :photo_comments do |t|
      t.text :content

      t.references :photos, :null => false
      t.references :users, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :photo_comments
  end
end
