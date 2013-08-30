class ConversationMember < ActiveRecord::Base
  belongs_to :conversation, :validate => true
  has_one :user, :validate => true
end
