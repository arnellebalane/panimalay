class ConversationMember < ActiveRecord::Base
  belongs_to :conversation, :validate => true
  belongs_to :user, :validate => true
end
