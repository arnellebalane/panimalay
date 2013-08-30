class CreateMessageNotifications < ActiveRecord::Migration
  def up
    create_table :message_notifications do |t|
      t.references :users
      t.references :messages
      t.timestamps
    end
  end

  def down
    drop_table :message_notifications
  end
end
