class CreateDocumentDates < ActiveRecord::Migration
  def up
    create_table :document_dates do |t|
      t.datetime :document_date
      t.text :remarks

      t.references :documents
      t.timestamps
    end
  end

  def down
    drop_table :document_dates
  end
end
