class CreateGatepassUsers < ActiveRecord::Migration
  def up
    create_table :gatepass_users do |t|
      t.references :gatepasses
      t.references :users
      t.timestamps
    end
  end

  def down
    drop_table :gatepass_users
  end
end
