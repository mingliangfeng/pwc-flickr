# stub flickr requests with json file
require 'json'

module WebmockStubs

  def stub_search(query, page = 1, pages = nil)
    json = read_json_file File.expand_path("../../data-sample/flickr_search_#{query}_#{page}.json", __FILE__)
    json['pages'] = pages if pages
    stub_request(:post, "https://api.flickr.com/services/rest/").
      with(body: hash_including({"method"=>"flickr.photos.search", text: query, page: page.to_s})).to_return(
        body: json.to_json, status: 200
      )
  end

  def stub_get_info
    json = read_json_file File.expand_path("../../data-sample/flickr_getinfo.json", __FILE__)
    stub_request(:post, "https://api.flickr.com/services/rest/").
      with(body: hash_including({"method"=>"flickr.photos.getInfo"})).to_return(
        body: json.to_json, status: 200
      )
  end

private
  def read_json_file(file_name)
    JSON.parse File.read(file_name)
  end

end
