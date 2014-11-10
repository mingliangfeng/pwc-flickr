require 'rails_helper'
require 'ostruct'

RSpec.describe Photo do

  context 'Search Flickr photos by mocking Flickr Service for fast testing' do

    before(:each) do
      allow(FlickrProxy).to receive(:flickr_search) do |query, page|
        map_datas = [ {:id=>"15728640786", :secret=>"798df56fe0"},
                      {:id=>"15132403614", :secret=>"9e11357efa"} ]
        map_datas.map {|map_data| OpenStruct.new map_data }
      end

      allow(FlickrProxy).to receive(:flickr_get_info) do |id, secret|
        map_datas = {
          "15728640786-798df56fe0" => {"id"=>"15728640786", "secret"=>"798df56fe0", "server"=>"7495", "farm"=>8, "originalformat"=>"jpg", "title"=>"St. Andrews Patrol Cabin, Mt. Rainier National Park", "description"=>"", "dates"=>{"posted"=>"1415578993", "taken"=>"2011-10-16 14:24:03", "lastupdate"=>"1415579004"},  "tags"=>[], "urls"=>[{"type"=>"photopage", "_content"=>"https://www.flickr.com/photos/125838420@N07/15728640786/"}]},
          "15132403614-9e11357efa" => {"id"=>"15132403614", "secret"=>"9e11357efa", "server"=>"7556", "farm"=>8, "originalformat"=>"jpg", "title"=>"Along St. Andrews Trail to Klapatche Park, Mt. Rainier National Park", "description"=>"", "dates"=>{"posted"=>"1415579047", "taken"=>"2011-10-16 15:06:46", "takengranularity"=>"0", "lastupdate"=>"1415579058"}, "tags"=>[], "urls"=>[{"type"=>"photopage", "_content"=>"https://www.flickr.com/photos/125838420@N07/15132403614/"}]}
        }
        OpenStruct.new map_datas["#{id}-#{secret}"]
      end
    end

    it 'General search should return a list of Photo instances' do
      photos = Photo.search('a')
      expect(photos.length).not_to be(0)
      expect(photos[0]).to be_kind_of(Photo)
    end
    
  end

end
