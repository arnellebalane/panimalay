class Photo < ActiveRecord::Base
	attr_accessible :caption, :filename, :user_id, :mime_type
	validates :filename, :presence => true
	belongs_to :user
  has_one :binary, :dependent => :destroy
	has_many :comments, :as => :commentable, :dependent => :destroy
end
