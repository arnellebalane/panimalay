class Accountability < ActiveRecord::Base
  validates :name, :presence => true
  has_many :user_accountabilities, :validate => true, :dependent => :destroy
end
