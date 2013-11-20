class Album < ActiveRecord::Base
  has_many :sources
  belongs_to :user
  attr_accessible :category, :public, :title, :transition_time
end
