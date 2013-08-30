class EventComment < ActiveRecord::Base
  has_one :event
  belongs_to :user
  validates :content, :presence => true
end
