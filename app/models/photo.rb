class Photo

  attr_accessor :id, :secret, :title, :description, :tags, :url_thumbnail, :url_big

  SearchResult = Struct.new :query, :page, :pages, :total, :photos

  def initialize(id, secret)
    self.id, self.secret = id, secret
  end

  def self.search(query, page = 1)
    response_list = FlickrProxy.flickr_search(query, page)
    search_result = SearchResult.new query, response_list.page.to_i, response_list.pages.to_i, response_list.total.to_i
    photos = response_list.map {|response| Photo.new(response.id, response.secret) }
    photos.each {|photo| photo.fetch_info }
    search_result.photos = photos
    search_result
  end

  def fetch_info
    response_info = FlickrProxy.flickr_get_info(self.id, self.secret)
    self.title = response_info.title
    self.description = response_info.description
    self.tags = response_info.tags
    self.url_thumbnail = FlickrProxy.getThumbnailUrl(response_info)
    self.url_big = FlickrProxy.getBigPhotoUrl(response_info)
  end

end
