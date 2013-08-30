class CreateProperties < ActiveRecord::Migration
  def up
    create_table :properties do |t|
      t.string :name, :null => false
      t.integer :quantity, :default => 1
      t.integer :working_units
      
      t.timestamps
    end
  end

  def down
    drop_table :properties
  end
end
