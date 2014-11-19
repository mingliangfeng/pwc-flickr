require 'rails_helper'
#require 'httplog'

RSpec.describe "Photo Search", :type => :feature, js: true do

  before(:each) do
    WebMock.allow_net_connect!
    @default_wait_time = Capybara.default_wait_time
    Capybara.default_wait_time = 60
  end

  after(:each) do
    Capybara.default_wait_time = @default_wait_time
    WebMock.disable_net_connect!(:allow_localhost => true, :allow => "127.0.0.1")
  end

  it "get home page" do
    visit '/'
    expect(page).to have_content 'Search Flickr Photos'
  end

  it "search photos" do
    visit '/'
    within("#searh-form") do
      fill_in 'q', :with => 'test'
    end
    click_button 'search'

    expect(page).to have_css('.search-results')
    expect(page).to have_selector('.search-results a')
  end

  it "search photos and return 0 results" do
    visit '/'
    fill_in 'q', :with => 'thisisnothingtoshowtoforceazeroresult'
    click_button 'search'

    expect(page).to have_css('.search-results', :visible => false)
    expect(page).to have_no_selector('.search-results a', :visible => false)
    expect(page).to have_content 'No photo found'

    expect(page).to have_no_selector('.pagination', :visible => false)
  end

  it "search pagination" do


    visit '/'

    fill_in 'q', :with => 'test'
    click_button 'search'

    expect(page).to have_selector('ul.pagination li.disabled a span', text: /1/)

    #save_and_open_page
    find(:xpath, "//ul/li/a[@data-pager='2']").click
    expect(page).to have_selector('ul.pagination li.disabled a span', text: /2/)
  end

end
