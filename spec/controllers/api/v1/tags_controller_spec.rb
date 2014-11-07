require 'spec_helper'

describe Api::V1::TagsController do
  context "POST #create" do
    it "creates a tag" do
      post :create,
        format: :json,
        name: "Another~World"

      json_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq 201
      expect(json_response).to include("tag")
    end
  end

  context "GET #index" do
    it "should include created tags" do
      FactoryGirl.create(:tag)
      get :index, format: :json
      json_response = JSON.parse(response.body)['tags']
      expect(json_response.count).to eq 1
    end
  end
end
