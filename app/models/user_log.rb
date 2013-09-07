class UserLog < ActiveRecord::Base
  validates :destination, :date_out, :presence => true
  belongs_to :user
end
