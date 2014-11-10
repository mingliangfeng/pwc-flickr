class Photo

  attr_accessor :id, :secret, :title, :description, :tags, :url_thumbnail, :url_big

  def initialize(id, secret)
    self.id, self.secret = id, secret
  end

  def self.search(query, page = 1)
    response_list = FlickrProxy.flickr_search(query, page)
    photos = response_list.map {|response| Photo.new(response.id, response.secret) }
    photos.each {|photo| photo.fetch_info }
  end

  def fetch_info
    response_info = FlickrProxy.flickr_get_info(self.id, self.secret)
    self.title = response_info.title
    self.description = response_info.description
    self.tags = response_info.tags
    self.url_thumbnail = FlickRaw.url_q(response_info)
    self.url_big = FlickRaw.url_b(response_info)
  end

end
