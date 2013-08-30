class UserDevice < ActiveRecord::Base
  has_one :user
  has_one :device
end
