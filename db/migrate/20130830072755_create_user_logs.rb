class CreateUserLogs < ActiveRecord::Migration
  def up
    create_table :user_logs do |t|
      t.string :destination
      t.datetime :date_out
      t.datetime :date_in

      t.references :users, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :user_logs
  end
end
