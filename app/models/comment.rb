class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  attr_accessible :content, :commentable_id, :user_id
  validates :content, :presence => true
  validates :user_id, :presence => true
end
