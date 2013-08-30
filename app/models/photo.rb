class Photo < ActiveRecord::Base
  validates :filename, :presence => true
  belongs_to :user
  has_many :photo_comments, :validate => true, :dependent => :destroy
end
