class Event < ActiveRecord::Base
  belongs_to :event_category
  has_one :user
  has_many :event_comments, :validate => true, :dependent => :destroy
  validates :title, :presence => true
end
