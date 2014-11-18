require 'rails_helper'

RSpec.describe "Photo Search", :type => :feature, js: true do
  before(:each) do
    WebMock.disable_net_connect!(:allow_localhost => true, :allow => "127.0.0.1")
  end

  it "get home page" do
    visit '/'
    expect(page).to have_content 'Search Flickr Photos'
  end

  it "search photos" do
    visit '/'
    #save_and_open_page
    fill_in 'q', :with => 'test'
    click_button 'search'

    wait_for_ajax
    expect(page).to have_css('.search-results')
    expect(page).to have_selector('.search-results a')
  end

  it "search photos and return 0 results" do
    stub_request(:post, "https://api.flickr.com/services/rest/").
        with(:body => hash_including({"method"=>"flickr.photos.search"})).to_return(
          :body => File.new(File.expand_path('../../data-sample/flickr_search_empty.json', __FILE__)),
          :status => 200
        )
    visit '/'
    fill_in 'q', :with => 'thisisnothingtoshowtoforceazeroresult'
    click_button 'search'

    wait_for_ajax
    save_and_open_page
    expect(page).to have_css('.search-results', :visible => false)
    expect(page).to have_no_selector('.search-results a', :visible => false)
    expect(page).to have_content 'No photo found'

    expect(page).to have_no_selector('.pagination', :visible => false)
  end

end
