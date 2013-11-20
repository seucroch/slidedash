class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @albums = Album.find(params[:id])
  end

  def new
    @album = Album.new   
  end

  def create
  @album = Album.new(params[:album])
    
    if @album.save
      flash[:notice] = "Album was saved."
      redirect_to @album
    else
      flash[:error] = "There was an error saving the Album. Please try again."
      render :new
    end
  end

  def edit
    @album= Album.find(params[:id])
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
