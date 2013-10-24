class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :content
      t.references :commentable, :polymorphic => true
      t.references :user
      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :commentable_id
  end
end