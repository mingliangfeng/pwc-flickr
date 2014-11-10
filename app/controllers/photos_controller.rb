class PhotosController < ApplicationController

  def index
    if params[:q].present?
      @photoList = Photo.search params[:q].strip
    end
  end

end
