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
    authorize! :create, Album, message: "You need to be a member to create a new album."
    10.times { @album.sources.build} 
  end

  def create
    @album = current_user.albums.build(params[:album])
    authorize! :create, @album, message: "You need to be a member to create a new album."
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
    authorize! :edit, @album, message: "You need to own the album to edit it."
  end

  def update
    @album = Album.find(params[:id])
    authorize! :update, @album, message: "You need to own the album to edit it."
    if @album.update_attributes(params[:album])
      flash[:notice] = "Album was updated."
      redirect_to @album
    else
      flash[:error] = "There was an error saving the album. Please try again."
      render :edit
    end
  end
end
