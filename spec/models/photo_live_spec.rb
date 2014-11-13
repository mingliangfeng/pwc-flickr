require 'rails_helper'
require 'ostruct'

RSpec.describe Photo do

  context 'Search Flickr photos by hitting Flickr Service live' do

    before(:each) do
      WebMock.allow_net_connect!
    end

    it 'General search should return a list of Photo instances' do
      search_result = Photo.search('a')
      expect(search_result.photos.length).not_to be(0)
      expect(search_result.photos[0].title).not_to be_nil
    end

    it 'Test fetch info' do
      photo = Photo.new 15753706985, '4e74167847'
      expect(photo.title).to be_nil
      photo.fetch_info
      expect(photo.title).not_to be_nil
    end

    after(:each) do
      WebMock.disable_net_connect!(:allow_localhost => true, :allow => "127.0.0.1")
    end

  end

end
