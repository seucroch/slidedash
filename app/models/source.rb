class Source < ActiveRecord::Base
  belongs_to :album
  attr_accessible :active, :album, :number_post, :url

  validates_format_of :url, :without => /\A(http:)/, :message => "Please do not include 'http://'."
end
