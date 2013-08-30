class CreateDevices < ActiveRecord::Migration
  def up
    create_table :devices do |t|
      t.string :name, :null => false
      t.decimal :charge, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :devices
  end
end
