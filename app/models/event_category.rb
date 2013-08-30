class EventCategory < ActiveRecord::Base
  has_many :events, :validate => true, :dependent => :destroy
  validates :name, :presence => true, :uniqueness => true
end
