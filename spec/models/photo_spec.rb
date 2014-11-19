require 'rails_helper'

RSpec.describe Photo do

  before(:each) do
    @get_info_stub = stub_get_info
  end

  after(:each) do
    remove_request_stub @get_info_stub
  end

  context 'Search Flickr photos by mocking Flickr Service for fast testing' do

    it 'General search should return a list of Photo instances' do
      search_stub = stub_search 'test'

      search_result = Photo.search('test')
      expect(search_result.query).to eq('test')
      expect(search_result.total).to eq(237968441)
      expect(search_result.photos[0].id).to eq('15753706985')

      remove_request_stub search_stub
    end

    it 'Test fetch info' do
      photo = Photo.new 15753706985, '4e74167847'
      expect(photo.title).to be_nil
      photo.fetch_info
      expect(photo.title).not_to be_nil
    end

  end

end
