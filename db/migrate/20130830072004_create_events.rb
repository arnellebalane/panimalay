class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :title, :null => false
      t.text :description
      t.string :venue, :default => "Dormitory"
      t.datetime :event_date, :null => false
      t.references :event_category, :null => false
      t.references :user, :null => false
      t.timestamps
    end
    add_index :events, :event_category_id
    add_index :events, :user_id
  end

  def down
    drop_table :events
  end
end
