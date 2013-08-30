class CreateAccountabilities < ActiveRecord::Migration
  def up
    create_table :accountabilities do |t|
      t.string :name, :null => false
      t.text :description
      t.datetime :due_date

      t.timestamps
    end
  end

  def down
    drop_table :accountabilities
  end
end
