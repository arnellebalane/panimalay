class PropertyRemark < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :property
end
