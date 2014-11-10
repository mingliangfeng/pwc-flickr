class FlickrProxy

  # sort: date-posted-asc, date-posted-desc, date-taken-asc, date-taken-desc, interestingness-desc,
  #       interestingness-asc, relevance-asc, relevance-desc
  DEFAULT_SEARCH_CRITERIAS = { per_page: 20 }

  def self.flickr_search(query, page)
    # TODO: implementing searching by tags, flickr.photos.search tags: 'asian,food'
    flickr.photos.search DEFAULT_SEARCH_CRITERIAS.merge(text: query, page: page)
  end

  def self.flickr_get_info(id, secret)
    flickr.photos.getInfo photo_id: id, secret: secret
  end

end
