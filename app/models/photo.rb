class Photo < ActiveRecord::Base
	attr_accessible :caption, :fiename, :user_id
  validates :filename, :presence => true
  belongs_to :user
  has_many :photo_comments, :validate => true, :dependent => :destroy
end
