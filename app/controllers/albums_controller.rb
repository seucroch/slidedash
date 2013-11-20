class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
     @albums = Album.find(params[:id])
  end

  def new
  end

  def edit
  end
end
