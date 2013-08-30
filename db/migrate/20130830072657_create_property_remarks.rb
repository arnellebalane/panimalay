class CreatePropertyRemarks < ActiveRecord::Migration
  def up
    create_table :property_remarks do |t|
      t.text :content

      t.references :properties
      t.timestamps
    end
  end

  def down
    drop_table :property_remarks
  end
end
