class UserInfo < ActiveRecord::Base
  validates :student_number, :firstname, :lastname, :presence => true
  belongs_to :user
end
