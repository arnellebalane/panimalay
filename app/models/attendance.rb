class Attendance < ActiveRecord::Base
  belongs_to :users
  validates :attendance_date, :presence => true
end
