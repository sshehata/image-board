class PhotosController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
  end

  def load_images
    @photos = Photo.order(:views).find_in_batches(start: params[:start], batch_size: 10)
  end

  def create
    @new_photo = current_user.photos.new(photo_params)
    if @new_photo.save
      redirect_to @new_photo.user
    else
      @user = current_user
      render '/users/show'
    end
  end

  def update
  end

  private
    def photo_params
      params.require(:photo).permit(:image)
    end
end
