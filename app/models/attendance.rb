class Attendance < ActiveRecord::Base
  has_one :users
  validates :attendance_date, :presence => true
end
