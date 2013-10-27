class Photo < ActiveRecord::Base
	attr_accessible :caption, :filename, :user_id, :binary_id, :mime_type
	validates :filename, :presence => true
	belongs_to :user
	has_many :comments, :as => :commentable, :dependent => :destroy
end
