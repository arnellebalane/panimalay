class CreateUserInfos < ActiveRecord::Migration
  def up
    create_table :user_infos do |t|
      t.string :student_number, :null => false
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.date :birthday
      t.string :contact_number
      t.string :address

      t.references :users, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :user_infos
  end
end
