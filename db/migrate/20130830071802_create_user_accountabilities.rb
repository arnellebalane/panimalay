class CreateUserAccountabilities < ActiveRecord::Migration
  def up
    create_table :user_accountabilities do |t|
      t.string :status

      t.references :users
      t.references :accountabilities
      t.timestamps
    end
  end

  def down
    drop_table :user_accountabilities
  end
end
