class BodyPart < ActiveRecord::Base
  has_many :exercises
  attr_accessible :name, :x1, :x2, :y1, :y2
end
