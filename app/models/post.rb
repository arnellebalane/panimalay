class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  attr_accessible :content, :user_id
  validates :content, :presence => true
  validates :user_id, :presence => true
end
