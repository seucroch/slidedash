class Source < ActiveRecord::Base
  belongs_to :album
  attr_accessible :active, :album, :number_post, :url

  validates :url, :exclusion => { :in => %w(http:),
    :message => "Please enter your Tumblr url without http:// or https://" }
end
