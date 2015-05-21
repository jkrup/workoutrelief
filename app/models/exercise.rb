class Exercise < ActiveRecord::Base
  acts_as_voteable
  belongs_to :bodypart, :class_name => 'BodyPart'
  belongs_to :user
  attr_accessible :bodypart_id, :details, :name, :votes, :youtube
end
