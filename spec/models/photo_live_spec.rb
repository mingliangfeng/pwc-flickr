require 'rails_helper'
require 'ostruct'

RSpec.describe Photo do

  context 'Search Flickr photos by hitting Flickr Service live' do

    it 'General search should return a list of Photo instances' do
      photos = Photo.search('a')
      expect(photos.length).not_to be(0)
      expect(photos[0]).to be_kind_of(Photo)
    end
    
  end

end
