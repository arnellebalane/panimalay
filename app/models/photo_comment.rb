class PhotoComment < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :photo
  belongs_to :user
end
