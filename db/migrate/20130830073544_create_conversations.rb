class CreateConversations < ActiveRecord::Migration
  def up
    create_table :conversations do |t|
      t.timestamps
    end
  end

  def down
    drop_table :conversations
  end
end
