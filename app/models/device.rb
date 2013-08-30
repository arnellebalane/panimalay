class Device < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :charge, :presence => true
  has_many :user_devices, :validate => true, :dependent => :destroy
end
