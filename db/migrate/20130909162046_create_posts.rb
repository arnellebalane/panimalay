class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.text :content
      t.references :user, :null => false
      t.timestamps
    end
    add_index :posts, :user_id
  end
end
