class Gatepass < ActiveRecord::Base
  validates :gatepass_date, :purpose, :presence => true
  has_many :gatepass_users, :validate => true, :dependent => :destroy
end
