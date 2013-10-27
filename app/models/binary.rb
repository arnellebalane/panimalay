class Binary < ActiveRecord::Base
  attr_accessible :data, :photo_id
  belongs_to :photo
end
