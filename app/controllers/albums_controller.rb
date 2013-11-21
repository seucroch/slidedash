class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    @sources = @album.sources
    @source = Source.new
  end

  def new
    @album = Album.new  
    10.times { @album.sources.build} 
  end

  def create
  @album = current_user.albums.build(params[:album])
    if @album.save
      flash[:notice] = "Album was saved."
      redirect_to @album
    else
      flash[:error] = "There was an error saving the Album. Please try again."
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:post])
      flash[:notice] = "Album was updated."
      redirect_to @album
    else
      flash[:error] = "There was an error saving the album. Please try again."
      render :edit
    end
  end
end
