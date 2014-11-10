class PhotosController < ApplicationController

  def index
    if params[:q].present?
      @search_result = Photo.search params[:q].strip
    end
  end

end
