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
  end

end
