class CreateUserInfos < ActiveRecord::Migration
  def up
    create_table :user_infos do |t|
      t.string :student_number, :null => false
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :nickname
      t.string :course
      t.date :birthday
      t.string :contact_number
      t.string :address
      t.string :fathername
      t.string :mothername
      t.string :elementary
      t.string :secondary
      t.string :college, :default => 'University of the Philippines Cebu'
      t.string :bracket
      t.integer :year
      t.string :guardianname
      t.string :guardianaddress
      t.string :guardiancontact_number
      t.references :user, :null => false
      t.timestamps
    end
    add_index :user_infos, :user_id
  end

  def down
    drop_table :user_infos
  end
end
