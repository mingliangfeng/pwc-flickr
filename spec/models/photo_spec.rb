require 'rails_helper'
require 'ostruct'

RSpec.describe Photo do

  context 'Search Flickr photos by mocking Flickr Service for fast testing' do

    before(:each) do
      stub_request(:post, "https://api.flickr.com/services/rest/").
        with(:body => hash_including({"method"=>"flickr.photos.search"})).to_return(
      :body => File.new(File.expand_path('../../data-sample/flickr_search_a.json', __FILE__)),
      :status => 200 )

      stub_request(:post, "https://api.flickr.com/services/rest/").
        with(:body => hash_including({"method"=>"flickr.photos.getInfo"})).to_return(
      :body => File.new(File.expand_path('../../data-sample/flickr_getinfo.json', __FILE__)),
      :status => 200 )
    end

    it 'General search should return a list of Photo instances' do
      search_result = Photo.search('a')
      expect(search_result.total).to eq('237968441')
      expect(search_result.photos[0].id).to eq('15753706985')
    end

    it 'Test fetch info' do
      photo = Photo.new 15753706985, 4e74167847
      expect(photo.title).to be_nil
      photo.fetch_info
      expect(photo.title).not_to be_nil
    end

  end

end
