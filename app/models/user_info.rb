class UserInfo < ActiveRecord::Base
	attr_accessible :student_number, :firstname, :lastname, :birthday, :contact_number, :address
  validates :student_number, :firstname, :lastname, :presence => true
  belongs_to :user
end
