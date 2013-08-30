class CreatePropertyLogs < ActiveRecord::Migration
  def up
    create_table :property_logs do |t|
      t.string :borrower, :null => false
      t.datetime :date_borrowed
      t.datetime :date_returned
      t.text :purpose

      t.references :properties, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :property_logs
  end
end
