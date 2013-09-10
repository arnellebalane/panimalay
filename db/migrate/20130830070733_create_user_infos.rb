class CreateUserInfos < ActiveRecord::Migration
  def up
    create_table :user_infos do |t|
      t.string :student_number, :null => false
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :course
      t.date :birthday
      t.string :contact_number
      t.string :address
      t.references :user, :null => false
      t.timestamps
    end
    add_index :user_infos, :user_id
  end

  def down
    drop_table :user_infos
  end
end
