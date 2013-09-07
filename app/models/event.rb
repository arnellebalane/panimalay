class Event < ActiveRecord::Base
  belongs_to :event_category
  belongs_to :user
  has_many :event_comments, :validate => true, :dependent => :destroy
  validates :title, :presence => true
end
