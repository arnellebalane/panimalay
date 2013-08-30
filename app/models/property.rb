class Property < ActiveRecord::Base
  validates :name, :quantity, :working_units, :presence => true
  has_many :property_remarks, :validate => true, :dependent => :destroy
  has_many :property_log, :validate => true, :dependent => :destroy
end
