require 'rails_helper'

RSpec.describe "photos/index.html.erb", :type => :view do

  it "index page should have search text field" do
    render
    expect(rendered).to match /search/
  end

  it "should display photos when get result" do
    assign:search_result, Photo::SearchResult.new("query text", 1, 10, 200, [])
    render
    expect(rendered).to match /Search results for "query text"/
  end

end
