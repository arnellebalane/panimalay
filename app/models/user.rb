class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :email, :password, :presence => true
  has_many :announcements, :validate => true, :dependent => :destroy
  has_many :attendances, :validate => true, :dependent => :destroy
  has_many :conversation_members, :validate => true, :dependent => :destroy
  has_many :conversations,  :through => :conversation_member , :validate => true, :dependent => :destroy
  has_many :events, :validate => true, :dependent => :destroy
  has_many :event_comments, :validate => true, :dependent => :destroy
  has_many :gatepass_users, :validate => true, :dependent => :destroy
  has_many :messages, :validate => true, :dependent => :destroy
  has_many :message_notifications, :validate => true, :dependent => :destroy
  has_many :photos, :validate => true, :dependent => :destroy
  has_many :user_accountabilities, :validate => true, :dependent => :destroy
  has_many :user_devices, :validate => true, :dependent => :destroy
  has_one :user_info, :validate => true, :dependent => :destroy
  has_many :user_logs, :validate => true, :dependent => :destroy
  has_many :posts
  has_many :comments, :through => :posts
end
