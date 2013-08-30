class Message < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :conversation
  has_one :user
  has_many :message_notifications, :validate => true, :dependent => :destroy
end
