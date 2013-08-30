class CreateAnnouncements < ActiveRecord::Migration
  def up
    create_table :announcements do |t|
      t.string :title, :null => false
      t.text :content
      t.string :privacy

      t.references :users
      t.timestamps
    end
  end

  def down
    drop_table :announcements
  end
end
