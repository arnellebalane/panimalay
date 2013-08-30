class CreateUserDevices < ActiveRecord::Migration
  def up
    create_table :user_devices do |t|
      t.text :description
      t.integer :quantity, :default => 1

      t.references :users, :null => false
      t.references :devices, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :user_devices
  end
end
