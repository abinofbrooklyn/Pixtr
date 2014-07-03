class GalleriesController < ApplicationController
 
  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new # only to make "form for" work
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to galleries_path
    else
      render :new
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery  = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to @gallery
    else
      render :edit
    end
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to "/galleries"
  end

  private

  def gallery_params
    params.
      require(:gallery).
      permit(:name, :description)
  end
end
