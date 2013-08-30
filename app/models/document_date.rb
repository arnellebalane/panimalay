class DocumentDate < ActiveRecord::Base
  belongs_to :document
  validates :document_date, :remarks, :presence => true
end
