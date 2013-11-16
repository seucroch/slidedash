class Source < ActiveRecord::Base
  belongs_to :album
  attr_accessible :active, :album, :number_post, :url
end
