class CreateGatepasses < ActiveRecord::Migration
  def up
    create_table :gatepasses do |t|
      t.datetime :gatepass_date , :null => false
      t.text :purpose

      t.timestamps
    end
  end

  def down
    drop_table :gatepasses
  end
end
