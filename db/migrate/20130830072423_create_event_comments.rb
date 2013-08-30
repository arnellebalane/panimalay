class CreateEventComments < ActiveRecord::Migration
  def up
    create_table :event_comments do |t|
      t.text :content

      t.references :users, :null => false
      t.references :events, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :event_comments
  end
end
