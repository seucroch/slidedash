class SourcesController < ApplicationController
  respond_to :html, :js
  def show
  end

  def index
    @album = Album.find(params[:album_id])
    @sources = @album.source
  end

  def edit
  end

  def new
  end

  def create
    @album = Album.find(params[:album_id])
    @source = @album.sources.build(params[:source])

    if @source.save
      flash[:notice] = "Source was created."
    else
      flash[:error] = "There was an error saving the source. Please try again."
    end

    respond_with(@source) do |f|
      f.html { redirect_to [@album] }
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album = @album.sources.find(params[:album_id])

    @sources = @album.sources.find(params[:id])
    authorize! :destroy, @source, message: "You need to own the source to delete it."

    if @source.destroy
      flash[:notice] = "Source was removed."
    else
      flash[:error] = "Source couldn't be deleted. Try again."
    end

    respond_with(@source) do |f|
      f.html { redirect_to [@album] }
    end
  end
end
