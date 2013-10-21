class Announcement < ActiveRecord::Base
	attr_accessible :user_id, :title, :content, :privacy
  belongs_to :user 
  validates :title, :privacy, :content, :user_id, :presence => true
  validates :privacy, :inclusion => {:in => %w(public private), :message => "%{value} is not a valid privacy!"}
end
