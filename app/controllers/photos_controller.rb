class PhotosController < ApplicationController

  def index
    if params[:q].present?
      page = params[:page] and params[:page].to_i or 1
      @search_result = Photo.search params[:q].strip, page
    end
  end

end
