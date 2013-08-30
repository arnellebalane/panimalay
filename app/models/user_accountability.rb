class UserAccountability < ActiveRecord::Base
  validates :status, :presence => true
  has_one :user
  belongs_to :accountability
end
