class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    photo = Photo.find(params[:photo_id])
    comment = photo.comments.new(comment_params)
    comment.user = current_user
    comment.save
    redirect_to photo
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end
