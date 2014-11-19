require 'rails_helper'

RSpec.describe PhotosController, :type => :controller do

  before(:each) do
    @search_stub = stub_search 'test'
    @get_info_stub = stub_get_info
  end

  after(:each) do
    remove_request_stub @search_stub
    remove_request_stub @get_info_stub
  end

  describe "GET index" do

    it "returns http success by default" do
      get :index
      expect(response).to be_success
      expect(assigns(:search_result)).to be_nil
    end

  end

  describe 'GET search' do
    it "returns http success with search result" do
      get :search, {q: "test", format: :json}
      expect(response).to be_success
      parsed_body = JSON.parse(response.body)

      expect(parsed_body['pages']).to be >= 0
    end
  end

end
