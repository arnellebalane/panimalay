class PropertyLog < ActiveRecord::Base
  validates :borrower, :purpose, :presence => true
  belongs_to :property
end
