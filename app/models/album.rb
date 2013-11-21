class Album < ActiveRecord::Base
  has_many :sources
  belongs_to :user
  attr_accessible :category, :public, :title, :transition_time

   default_scope order('created_at DESC')
end
