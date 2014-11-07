require 'spec_helper'

describe Api::V1::TagsController do
  context "GET #index" do
    it "should include created tags" do
      FactoryGirl.create(:tag)
      get :index, format: :json
      json_response = JSON.parse(response.body)['tags']
      expect(json_response.count).to eq 1
    end
  end
end
