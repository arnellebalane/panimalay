class Conversation < ActiveRecord::Base
  has_many :conversation_members, :dependent => :destroy
  has_many :messages, :dependent => :destroy
end
