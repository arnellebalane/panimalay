class MessageNotification < ActiveRecord::Base
  has_one :user
  has_one :message
end
