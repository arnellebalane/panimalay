class CreateAttendances < ActiveRecord::Migration
  def up
    create_table :attendances do |t|
      t.date :attendance_date, :null => false
      t.boolean :present, :default => true

      t.references :users
      t.timestamps
    end
  end

  def down
    drop_table :attendances
  end
end
