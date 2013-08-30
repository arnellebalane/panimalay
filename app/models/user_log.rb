class UserLog < ActiveRecord::Base
  validates :destination, :date_out, :presence => true
  has_one :user
end
