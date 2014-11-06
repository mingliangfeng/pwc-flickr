require 'rails_helper'

RSpec.describe "photos/index.html.erb", :type => :view do
  it "index page should have search text field" do
    render
    expect(rendered).to match /search/
  end

end
