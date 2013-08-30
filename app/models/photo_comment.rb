class PhotoComment < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :photo
  has_one :user
end
