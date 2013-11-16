class Album < ActiveRecord::Base
  has_many :sources
  attr_accessible :category, :public, :title, :transition_time
end
