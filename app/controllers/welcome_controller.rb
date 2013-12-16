class WelcomeController < ApplicationController
  def index
    @albums = Album.all
  end

  def about
  end
end
