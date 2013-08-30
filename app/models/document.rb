class Document < ActiveRecord::Base
  validates :title, :filename, :presence => true
  has_many :document_dates, :validate => true, :dependent => :destroy
end
