class CreateConversationMembers < ActiveRecord::Migration
  def up
    create_table :conversation_members do |t|
      t.references :users
      t.references :conversations
      t.timestamps
    end
  end

  def down
    drop_table :conversation_members
  end
end
