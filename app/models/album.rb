class Album < ActiveRecord::Base
  has_many :sources, dependent: :destroy

  accepts_nested_attributes_for :sources

  belongs_to :user
  

  attr_accessible :category, :public, :title, :transition_time, :sources

   default_scope order('created_at DESC')
end
