class AddBinaryColumnsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :binary_id, :integer
    add_column :photos, :mime_type, :string
  end
end
