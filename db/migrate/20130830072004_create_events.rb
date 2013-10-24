class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :title, :null => false
      t.text :description
      t.string :venue, :default => "Dormitory"
      t.datetime :event_date

      t.references :event_categories, :null => false
      t.references :user, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
