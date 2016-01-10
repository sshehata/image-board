class PhotosController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @photos = Photo.order(:views)
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

  def show
    @photo = Photo.find(params[:id])
    @photo.views = @photo.views + 1
    @photo.save
  end

  def destroy
    Photo.find(params[:id]).destroy
    redirect_to current_user
  end

  private
    def photo_params
      params.require(:photo).permit(:image, :title)
    end
end
