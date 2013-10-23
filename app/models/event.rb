class Event < ActiveRecord::Base
	attr_accessible :title, :description, :venue, :event_date, :event_category_id, :user_id
  belongs_to :event_category
  belongs_to :user
  has_many :comments, :as => :commentable, :validate => true, :dependent => :destroy
  validates :title, :presence => true
end
