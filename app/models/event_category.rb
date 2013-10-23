class EventCategory < ActiveRecord::Base
	attr_accessible :name
  has_many :events, :validate => true, :dependent => :destroy
  validates :name, :presence => true, :uniqueness => true
end
