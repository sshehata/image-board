class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @new_photo = Photo.new
    @new_photo.user = @user
  end
end
