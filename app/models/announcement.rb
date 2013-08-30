class Announcement < ActiveRecord::Base
  belongs_to: users 
  validates :title, :privacy, :content, :user_id, :presence => true
  validates :privacy, :inclusion => {:in => %w(public private), :message => "%{value} is not a valid privacy!"}
end
