class UserInfo < ActiveRecord::Base
	attr_accessible :student_number, :firstname, :lastname, :nickname, :course, :birthday, :contact_number, :address, :user_id, :photo_id, :fathername, :mothername, :elementary, :secondary, :college, :bracket, :year, :guardianname, :guardianaddress, :guardiancontact_number
  validates :student_number, :firstname, :lastname, :presence => true
  belongs_to :user
  has_one :photo
end
