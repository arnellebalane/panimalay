class GatepassUser < ActiveRecord::Base
  has_one :gatepass
  has_one :user
end
