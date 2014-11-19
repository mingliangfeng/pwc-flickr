class PhotosController < ApplicationController

  def search
    photos = []
    if params[:q].present?
      page = params[:page].presence || 1
      photos = Photo.search params[:q].strip, page
    end
    respond_to do |format|
      format.json { render json: photos }
    end
  end

end
