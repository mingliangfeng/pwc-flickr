require 'rails_helper'

RSpec.describe PhotosController, :type => :controller do

  describe "GET index" do

    it "returns http success by default" do
      get :index
      expect(response).to be_success
      expect(assigns(:search_result)).to be_nil
    end

    it "returns http success with search result" do
      get :index, {q: "query"}
      expect(response).to be_success
      expect(assigns(:search_result)).not_to be_nil
    end

  end

end
