class UserAccountability < ActiveRecord::Base
  validates :status, :presence => true
  belongs_to :user
  belongs_to :accountability
end
