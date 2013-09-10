class UserInfo < ActiveRecord::Base
	attr_accessible :student_number, :firstname, :lastname, :course, :birthday, :contact_number, :address, :user_id
  validates :student_number, :firstname, :lastname, :presence => true
  belongs_to :user
end
