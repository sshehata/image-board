class PhotosController < ApplicationController
  def index
  end

  def load_images
    @photos = Photo.order(:views).find_in_batches(start: params[:start], batch_size: 10)
  end

  def create
  end

  def update
  end
end
